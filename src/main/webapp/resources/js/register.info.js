$().ready(function () {
  var $container = $('#container');
  var $userid = $container.find('input[name="userid"]');
  var $password = $container.find('input[name="password"]');
  var $password2 = $container.find('input[name="password2"]');
  var $email = $container.find('input[name="email"]');
  var $nickname = $container.find('input[name="nickname"]');
  var _set = {
    isSubmitted: false
  };
  var _fn = {
    init: function () {
      $userid.on('change focus keyup', function () {
        _fn.validateUserid();
      });
      $password.on('change focus keyup', function () {
        _fn.validatePassword();
      });
      $password2.on('change focus keyup', function () {
        _fn.validatePassword2();
      });
      $email.on('change focus keyup', function () {
        _fn.validateEmail();
      });
      $nickname.on('change focus keyup', function () {
        _fn.validateNickname();
      });
      $container.on('submit', function () {
        _fn.onSubmit();
        return false;
      });
    },
    validateUserid: function () {
      var userid = $userid.val();
      var $caution = $userid.next('div.caution');
      if (userid.length < 4) {
        $userid.addClass('caution').removeClass('pass');
        $caution.text('4자 이상 입력하세요').show();
      } else if (/^[a-z0-9]+$/.test(userid) === false) {
        $userid.addClass('caution').removeClass('pass');
        $caution.text('영문, 숫자만 입력하세요').show();
      } else {
        $userid.addClass('pass').removeClass('caution');
        $caution.hide();
      }
    },
    validatePassword: function () {
      var password = $password.val();
      var $caution = $password.next('div.caution');
      if (password.length < 4) {
        $password.addClass('caution').removeClass('pass');
        $caution.text('4자 이상 입력하세요').show();
      } else {
        $password.addClass('pass').removeClass('caution');
        $caution.hide();
      }
    },
    validatePassword2: function () {
      var password2 = $password2.val();
      var password = $password.val();
      var $caution = $password2.next('div.caution');
      if (password2 !== password) {
        $password2.addClass('caution').removeClass('pass');
        $caution.text('비밀번호가 일치하지 않습니다').show();
      } else {
        $password2.addClass('pass').removeClass('caution');
        $caution.hide();
      }
    },
    validateEmail: function () {
      var email = $email.val();
      var $caution = $email.next('div.caution');
      if (/^((\w|[`~!$#%^&*\-={}|'./?])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/.test(email) === false) {
        $email.addClass('caution').removeClass('pass');
        $caution.text('올바른 이메일을 입력하세요').show();
      } else {
        $email.addClass('pass').removeClass('caution');
        $caution.hide();
      }
    },
    validateNickname: function () {
      var nickname = $nickname.val();
      var $caution = $nickname.next('div.caution');
      if (nickname.length < 2) {
        $nickname.addClass('caution').removeClass('pass');
        $caution.text('2자 이상 입력하세요').show();
      } else if (/\s/.test(nickname) === true) {
        $nickname.addClass('caution').removeClass('pass');
        $caution.text('공백을 포함할 수 없습니다').show();
      } else {
        $nickname.addClass('pass').removeClass('caution');
        $caution.hide();
      }
    },
    onSubmit: function () {
      if (_set.isSubmitted === true) {
        return;
      }
      if ($userid.is(':not(.pass)') || $password.is(':not(.pass)') || $password2.is(':not(.pass)') || $email.is(':not(.pass)') || $nickname.is(':not(.pass)')) {
        alert('모든 정보를 올바르게 입력해주세요.');
        return;
      }
      _set.isSubmitted = true;
      $.ajax({
        url: _apiServerUrl + '/save/user',
        xhrFields: {withCredentials: true},
        type: 'POST',
        data: {
          userid: $userid.val(),
          password: $password.val(),
          email: $email.val(),
          nickname: $nickname.val()
        },
        success: function (data) {
          _set.isSubmitted = false;
          var responseCode = $(data).find('response').text();
          if (responseCode === '-1') {
            alert('아이디를 입력하세요.');
            $userid.focus();
          } else if (responseCode === '-2') {
            alert('아이디는 4~20자만 가능합니다.');
            $userid.focus();
          } else if (responseCode === '-3') {
            alert('아이디는 영문, 숫자만 가능합니다.');
            $userid.focus();
          } else if (responseCode === '-4') {
            alert('이미 등록된 아이디입니다.');
            $userid.focus();
          } else if (responseCode === '-5') {
            alert('비밀번호를 입력하세요.');
            $password.focus();
          } else if (responseCode === '-6') {
            alert('비밀번호는 4~20자만 가능합니다.');
            $password.focus();
          } else if (responseCode === '-17') {
            alert('아이디와 동일한 비밀번호는 이용할 수 없습니다.');
          } else if (responseCode === '-12') {
            alert('이메일을 입력하세요.');
            $email.focus();
          } else if (responseCode === '-18') {
            alert('올바른 이메일을 입력하세요.');
            $email.focus();
          } else if (responseCode === '-13') {
            alert('이미 등록된 이메일입니다.');
            $email.focus();
          } else if (responseCode === '-9') {
            alert('닉네임을 입력하세요.');
            $nickname.focus();
          } else if (responseCode === '-10') {
            alert('닉네임은 10자 이내로 입력하세요.');
            $nickname.focus();
          } else if (responseCode === '-16') {
            alert('닉네임에 공백을 포함할 수 없습니다.');
            $nickname.focus();
          } else if (responseCode === '-11') {
            alert('이미 등록된 닉네임입니다.');
            $nickname.focus();
          } else if (responseCode === '-7' || responseCode === '-14' || responseCode === '-15') {
            alert('일부 정보가 존재하지 않습니다. 정상적인 회원가입 절차에 따라 다시 진행해주세요.');
          } else if (responseCode === '-19') {
            alert('이미 가입된 계정이 있습니다. 아이디/비밀번호 찾기를 이용해주세요.');
          } else if (responseCode === '-20') {
            alert('반복적인 탈퇴 및 재가입은 일정 기간 제한됩니다.');
          } else if (responseCode === '0') {
            alert('더 이상 회원가입을 진행할 수 없습니다. [문의하기]를 통해 문의해주시기 바랍니다.');
          } else {
            var message = '회원가입이 완료되었습니다.';
            if ($container.data('adagreement') === 1) {
              var date = new Date();
              var adAgreementDate = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일';
              message += '\n\n에브리타임\n' + adAgreementDate + '\n광고성 정보 수신 동의 완료';
            }
            alert(message);
            location.href = $container.data('redirecturl');
          }
        }
      });
    }
  };
  _fn.init();
});