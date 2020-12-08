bookstore.index = {
  loaded: false,
  loadedLength: 0,
  parseParams: function (url) {
    var urlParams = bookstore.fn.parseUrlParams(url);
    var keyword = urlParams.keyword ? urlParams.keyword.trim() : '';
    var campus = !isNaN(Number(urlParams.campus)) ? Number(urlParams.campus) : 0;
    return {
      keyword: keyword,
      campus: campus
    };
  },
  goLinkContent: function ($searchForm, $itemsDiv, that, event) {
    event.stopPropagation();
    if (typeof history.pushState === 'undefined') {
      return false;
    }
    var url = $(that).attr('href');
    event.preventDefault();
    history.pushState(null, null, url);
    var params = bookstore.index.parseParams(url);
    bookstore.index.loadItems($searchForm, $itemsDiv, params, 0);
  },
  goRedirectContent: function ($searchForm, $itemsDiv, url) {
    if (typeof history.pushState === 'undefined') {
      location.href = url;
      return false;
    }
    history.pushState(null, null, url);
    var params = bookstore.index.parseParams(url);
    bookstore.index.loadItems($searchForm, $itemsDiv, params, 0);
    return false;
  },
  init: function ($searchForm, $itemsDiv) {
    var $header = $('<div></div>').addClass('header');
    $('<h1></h1>').html('&nbsp;').appendTo($header);
    var $filter = $('<div></div>').addClass('filter').appendTo($header);
    var $filterCampus = $('<a></a>').addClass('campus').appendTo($filter);
    $('<span></span>').addClass('text').appendTo($filterCampus);
    $('<span></span>').addClass('icons arrowdown-gray-14').appendTo($filterCampus);
    $header.appendTo($itemsDiv);
    var params = bookstore.index.parseParams();
    bookstore.index.loadItems($searchForm, $itemsDiv, params, 0);
  },
  loadItems: function ($searchForm, $itemsDiv, params, start) {
    $('#loading').show();
    $searchForm.find('input[name="keyword"]').val(params.keyword);
    bookstore.index.loaded = false;
    if (!start) {
      bookstore.index.loadedLength = 0;
      $itemsDiv.find('a.item').remove();
    }
    if (typeof Storage !== 'undefined') {
      var previouspageCache = sessionStorage.getItem('previouspage');
      if (!start && previouspageCache && previouspageCache.substr(0, 5) === '/view') {
        var key = location.pathname + location.search;
        var itemlistLengthCache = sessionStorage.getItem('itemlist_length_' + key);
        var itemlistHtmlCache = sessionStorage.getItem('itemlist_html_' + key);
        var itemlistScrollCache = sessionStorage.getItem('itemlist_scroll_' + key);
        if (itemlistLengthCache && itemlistHtmlCache && itemlistHtmlCache) {
          $itemsDiv.html(itemlistHtmlCache);
          bookstore.index.loaded = true;
          bookstore.index.loadedLength = Number(itemlistLengthCache) || 0;
          $('#loading').hide();
          $(window).scrollTop(Number(itemlistScrollCache) || 0);
          return;
        }
      }
    }
    bookstore.fn.findItemList(0, params.keyword, params.campus, start, function (response) {
      $('#loading').hide();
      if (response.error) {
        var message = '책 목록을 불러올 수 없습니다.';
        if (response.error === 'TooManyBooks') {
          message = '정확한 검색 결과를 위해<br>구체적인 검색어를 입력해주세요.';
        }
        $('<a></a>').addClass('item empty').html(message).appendTo($itemsDiv);
        return false;
      }
      var $header = $itemsDiv.find('> div.header');
      var $title = $header.find('> h1');
      var $filter = $header.find('> div.filter');
      var $filterCampus = $filter.find('a.campus');
      if (params.keyword) {
        var titleText = '검색 결과: ';
        if (response.length >= 40) {
          titleText += '40개 이상';
        } else {
          titleText += response.length + '개';
        }
        $title.text(titleText);
      } else {
        $title.text('최근 올라온 책');
      }
      var filterCampusText = '전체 학교';
      if (params.campus > 0) {
        filterCampusText = '학교';
        if (typeof bookstore.data.user !== 'undefined') {
          var currentCampus = _.find(bookstore.data.campuses, function (campus) {
            return campus.id === params.campus;
          });
          if (currentCampus) {
            filterCampusText = currentCampus.full_name;
          }
        }
      }
      $filterCampus.find('span.text').text(filterCampusText);
      _.each(response, function (item) {
        var $item = $('<a></a>').addClass('item').data('item', item).attr({
          href: '/view/' + item.id
        });
        if (item.soldout) {
          $item.addClass('soldout');
        }
        var $thumb = $('<div></div>').addClass('thumb').appendTo($item);
        if (item.cover_image) {
          $thumb.css({
            'background-image': 'url("' + item.cover_image + '")'
          });
        }
        $('<h2></h2>').text(item.book_title).appendTo($item);
        var $detailsBook = $('<p></p>').addClass('details book').appendTo($item);
        $('<span></span>').text(item.book_author + ' 지음').appendTo($detailsBook);
        $('<span></span>').text(item.book_publisher).appendTo($detailsBook);
        var $detailsSeller = $('<p></p>').addClass('details').appendTo($item);
        $('<span></span>').addClass('icons user-gray-14').appendTo($detailsSeller);
        $('<span></span>').text(item.campus_full_name + ' ' + item.user_name).appendTo($detailsSeller);
        var $detailsMeans = $('<p></p>').addClass('details').appendTo($item);
        $('<span></span>').addClass('icons location-gray-14').appendTo($detailsMeans);
        if (item.means_delivery) {
          $('<span></span>').text('택배: 가능').appendTo($detailsMeans);
        }
        if (item.means_direct) {
          $('<span></span>').text('직거래: ' + item.means_direct_location_name).appendTo($detailsMeans);
        }
        var $price = $('<p></p>').addClass('price').appendTo($item);
        $('<span></span>').addClass('selling').text(bookstore.fn.formatPrice(item.price)).appendTo($price);
        if (item.book_price) {
          $('<span></span>').addClass('original').text(bookstore.fn.formatPrice(item.book_price)).appendTo($price);
        }
        $('<hr>').appendTo($item);
        $item.appendTo($itemsDiv);
      });
      if (!response.length) {
        if (!bookstore.index.loadedLength) {
          $('<a></a>').addClass('item empty').text('검색된 책이 없습니다.').appendTo($itemsDiv);
        }
        return false;
      }
      bookstore.index.loaded = true;
      bookstore.index.loadedLength += response.length;
      if (typeof Storage !== 'undefined') {
        var key = location.pathname + location.search;
        sessionStorage.setItem('itemlist_length_' + key, bookstore.index.loadedLength);
        sessionStorage.setItem('itemlist_html_' + key, $itemsDiv.html());
      }
    });
  },
  showFilterCampusPopup: function ($itemsDiv) {
    if (typeof bookstore.data.user === 'undefined') {
      alert('로그인 후 이용하실 수 있습니다!');
      return false;
    }
    var urlParams = bookstore.fn.parseUrlParams();
    var url = '?';
    if (urlParams.keyword) {
      url += 'keyword=' + encodeURIComponent(urlParams.keyword) + '&';
    }
    $itemsDiv.find('div.popup').hide().remove();
    var $container = $('<div></div>').addClass('popup popup-filter popup-filter-campus');
    $('<h2></h2>').text('학교 선택').appendTo($container);
    var $menuOl = $('<ol></ol>').addClass('menu').appendTo($container);
    var $menu1 = $('<li></li>').appendTo($menuOl);
    $('<a></a>').text('전체 학교').attr('href', url + 'campus=0').appendTo($menu1);
    _.each(bookstore.data.campuses, function (campus) {
      var $menu = $('<li></li>').appendTo($menuOl);
      $('<a></a>').text(campus.full_name).attr('href', url + 'campus=' + campus.id).appendTo($menu);
    });
    $container.appendTo($itemsDiv);
    $container.show();
  }
};

$().ready(function () {
  var $searchForm = $('#search > form');
  var $itemsDiv = $('#items');
  bookstore.index.init($searchForm, $itemsDiv);
  setTimeout(function () {
    $(window).on('popstate', function () {
      var params = bookstore.index.parseParams();
      bookstore.index.loadItems($searchForm, $itemsDiv, params, 0);
    });
  }, 0);

  $(window)
    .on('scroll', function () {
      var scrollTop = $(window).scrollTop();
      if (typeof Storage !== 'undefined') {
        var key = location.pathname + location.search;
        sessionStorage.setItem('itemlist_scroll_' + key, scrollTop);
      }
      if (!bookstore.index.loaded || bookstore.index.loadedLength % 40 !== 0) {
        return false;
      }
      if (scrollTop < ($(document).height() - $(window).height() - 300)) {
        return false;
      }
      var params = bookstore.index.parseParams();
      bookstore.index.loadItems($searchForm, $itemsDiv, params, bookstore.index.loadedLength);
    });

  $searchForm
    .on('submit', function () {
      var $keywordInput = $searchForm.find('input[name="keyword"]');
      var keyword = $keywordInput.val().trim();
      if (keyword.length < 2) {
        alert('검색어를 두 글자 이상 입력하세요!');
        $keywordInput.focus();
        return false;
      }
      $keywordInput.blur();
      var urlParams = bookstore.fn.parseUrlParams();
      var url = '?keyword=' + encodeURIComponent(keyword);
      if (urlParams.campus) {
        url += '&campus=' + urlParams.campus;
      }
      bookstore.index.goRedirectContent($searchForm, $itemsDiv, url);
      return false;
    })
    .on('click', 'div.searchbutton', function () {
      $searchForm.submit();
    });

  $itemsDiv
    .on('click', '> div.header > div.filter > a.campus', function () {
      bookstore.index.showFilterCampusPopup($itemsDiv);
    })
    .on('click', '> div.popup > input.button.close', function (event) {
      $itemsDiv.find('div.popup').hide().remove();
    })
    .on('click', '> div.popup-filter > ol.menu > li > a', function (event) {
      bookstore.index.goLinkContent($searchForm, $itemsDiv, this, event);
      $itemsDiv.find('div.popup-filter').hide().remove();
    });
});
