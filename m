Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71EEC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5vMBA4WbyDfwzMYYHxfFrjVBetcwnOWxDU5uCTtBOhY=; b=qU4acK4QWn3fxy
	0St+NSI4MZQt8ZLfEMAp+FfZL3tFAB18Qr2/dSFJ5qf8E74kFn5atH0GlEWv3EdDGcDOvTfGP9LcI
	AVrLr7BmyhOzpkaEgfY5OJwIJUQJnjr6HRaN8IVvcfaFDFZsb7cSxPJdv559/H/FswXMEt7EsgD+Z
	VxxZmolxyB9UxtQOQqXIQNe776qCIC455VOR6+44APoXVsX8SJ+xQWfDk8QjAigRqe2zyyGnyj3NI
	/TPzjcEVnxFTPSeKbg322x+rErMveWGR79OZb8v5Lp5lYPGAAyEY18qFE/Pt/exSH09jNLNI0PgmD
	yTC+n0CF7wErdEAAJerQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWzO-00EdAn-89; Thu, 05 Jan 2023 20:37:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3b4e-006wKP-Fb
	for linux-amlogic@lists.infradead.org; Fri, 09 Dec 2022 10:57:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m14so4807234wrh.7
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Dec 2022 02:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Xnhtnmg7jy2vioId7lE2F/yN+DAnsbwHsMyglO9wxM=;
        b=GJT51gq62lDju11G743mbN3vnF7hgzvIHO5evgojxDdrjSqjP/AO6huyn8mm+49xgA
         Gu1mi+ZDRrNlSspotbVXhwfOnoQ1WUurUnHhf7AQsockxFaWihSIkJRN2yWT+vWTZIQe
         vMYm7lneioQ+fG4LqI2dFjKcr65uUr1LyscHJ2Xua+jtkq4cmE6WrbZh6aQIDy0L9Wzw
         b/G9IP9jI+2TobPCcnJesNxdULA2eT0d6MlOaoox6SztptMYrK0mV/0Om06seBRIbiPW
         Pf+WbA0y4zueO0DxwPsCOw0bkc7ggbn+faQC1qptCePhDOt/oVyrWo0TDdVwenC4CvLZ
         mikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Xnhtnmg7jy2vioId7lE2F/yN+DAnsbwHsMyglO9wxM=;
        b=UNeWYE2LJYYoDtYF2Oj4ChMzUh6NEcSUMhXGo0Fxgj+8ZJmyed2GyHbR2xtiLbCa3p
         QA3MiytivcX3//lUv4L4UxU+vo3Plq91oxbiczbGL9O1q4UxF5pC102RfU85WvUI5BNj
         4+YwEXhPtuTfIkPIv6v/HhU3ntn4PHZBv+tMXpL2DTl9qoZ+sE5nOJf381BzJ6iD002w
         POpVdJjaQMa2cA6Jf2rw/nm3SbxuYPC8kER0pgYk0vLXjTwKwwJwaeE1VvUd6oaSXayZ
         5By/BiisFinXtZkXx777mmbs4O4v/OAUGDQmCArptqBea/UbieMR9lNVypvgCb0QNxZl
         iIDA==
X-Gm-Message-State: ANoB5plgjwndAdK55uKOivUegbIdwyA6f5sfgv++Dbcka6Uuz129QfXz
	PFj9/W5s6USGqh9zIuZK8bzsFbZuJxJpKrfK
X-Google-Smtp-Source: AA0mqf6BcyV6yZetirViW+kTPlfCFT0g8buZS0Y0lk/t750w5BBok5p7hgZSeAuIRSaD/UjaXC4QwA==
X-Received: by 2002:a5d:5187:0:b0:242:9e8:84b6 with SMTP id k7-20020a5d5187000000b0024209e884b6mr3280416wrv.13.1670583463261;
        Fri, 09 Dec 2022 02:57:43 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id bt4-20020a056000080400b002365cd93d05sm1085118wrb.102.2022.12.09.02.57.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Dec 2022 02:57:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: RE: VIM1's wifi doesn't work after update to Linux 6.1
Message-Id: <33E05D5D-E8C8-4493-B269-E3020D98740C@gmail.com>
Date: Fri, 9 Dec 2022 14:57:40 +0400
To: linux-amlogic <linux-amlogic@lists.infradead.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Zhang Ning <zhangn1985@outlook.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_025748_544672_9DEE85DE 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 05 Jan 2023 09:50:53 -0800
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

W3NuaXBdCgpIZWxsbyBaaGFuZywKCknigJl2ZSB0ZXN0LWJvb3RlZCBhIFZJTTEgdXNpbmcgbXkg
Y3VycmVudCBhbWxvZ2ljLTYuMS55IGJyYW5jaCAoYmFzZWQgb24gcmM4KSBhbmQgSSBkb27igJl0
IHNlZSBhbiBpc3N1ZSB3aXRoIFdpRmk6CgpodHRwOi8vaXguaW8vNGk3TQoKSGVyZeKAmXMgdGhl
IGtlcm5lbCBzb3VyY2UgYW5kIGRlZmNvbmZpZzoKCmh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0
L2xpbnV4L2NvbW1pdHMvYW1sb2dpYy02LjEueQpodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9M
aWJyZUVMRUMudHYvYmxvYi9hbWxvZ2ljL3Byb2plY3RzL0FtbG9naWMvbGludXgvbGludXguYWFy
Y2g2NC5jb25mCgpJbiB0aGUgTEUgaW1hZ2UgSSBoYXZlIHdsYW4wIGFuZCBjb25ubWFuIGlzIGxp
c3Rpbmcgc2VydmljZXM6CgpWSU0xOn4gIyBpZmNvbmZpZwpldGgwICAgICAgTGluayBlbmNhcDpF
dGhlcm5ldCAgSFdhZGRyIDE2OkE3Ojc5OjkzOkJFOkVCICAKICAgICAgICAgaW5ldCBhZGRyOjE5
Mi4xNjguMjAuMTIgIEJjYXN0OjE5Mi4xNjguMjAuMjU1ICBNYXNrOjI1NS4yNTUuMjU1LjAKICAg
ICAgICAgVVAgQlJPQURDQVNUIFJVTk5JTkcgTVVMVElDQVNUICBNVFU6MTUwMCAgTWV0cmljOjEK
ICAgICAgICAgUlggcGFja2V0czoxMDM2IGVycm9yczowIGRyb3BwZWQ6MCBvdmVycnVuczowIGZy
YW1lOjAKICAgICAgICAgVFggcGFja2V0czozMDggZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5z
OjAgY2FycmllcjowCiAgICAgICAgIGNvbGxpc2lvbnM6MCB0eHF1ZXVlbGVuOjEwMDAgCiAgICAg
ICAgIFJYIGJ5dGVzOjI1MjQ3MyAoMjQ2LjUgS2lCKSAgVFggYnl0ZXM6MTM0MTg5ICgxMzEuMCBL
aUIpCiAgICAgICAgIEludGVycnVwdDozMiAKLi4uCgp3bGFuMCAgICAgTGluayBlbmNhcDpFdGhl
cm5ldCAgSFdhZGRyIENDOkI4OkE4OkI1OjlGOjg2ICAKICAgICAgICAgVVAgQlJPQURDQVNUIE1V
TFRJQ0FTVCAgTVRVOjE1MDAgIE1ldHJpYzoxCiAgICAgICAgIFJYIHBhY2tldHM6MCBlcnJvcnM6
MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBmcmFtZTowCiAgICAgICAgIFRYIHBhY2tldHM6MCBlcnJv
cnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBjYXJyaWVyOjAKICAgICAgICAgY29sbGlzaW9uczow
IHR4cXVldWVsZW46MTAwMCAKICAgICAgICAgUlggYnl0ZXM6MCAoMC4wIEIpICBUWCBieXRlczow
ICgwLjAgQikKClZJTTE6fiAjIGNvbm5tYW5jdGwgc2VydmljZXMKKkFPIFdpcmVkICAgICAgICAg
ICAgICAgIGV0aGVybmV0XzE2YTc3OTkzYmVlYl9jYWJsZQoqQSAgQ0lSQ09MT0NPICAgICAgICAg
ICAgd2lmaV9jY2I4YThiNTlmODZfNDM0OTUyNDM0ZjRjNGY0MzRmX21hbmFnZWRfcHNrCgpJ4oCZ
dmUgcHVzaGVkIGFuIHVwZGF0ZWQgVklNMSBpbWFnZSB3aXRoIHRoYXQga2VybmVsIGhlcmU6Cgpo
dHRwczovL2NoZXdpdHQubGlicmVlbGVjLnR2L3Rlc3RpbmcvTGlicmVFTEVDLUFNTEdYLmFybS0x
MC44NS4wLWtoYWRhcy12aW0uaW1nLmd6CgpUaGVyZSBhcmUgYSBjb3VwbGUgb2YgcGF0Y2hlcyB0
aGF0IHR3ZWFrIFNESU8gc3BlZWRzIGluIG15IHRyZWUsIGJ1dCBub25lIG9mIHRoZW0gYXJlIG5l
dy4KCkFzIGl0IGxvb2tzIGxpa2UgeW91IGhhdmUgc29tZSBvZiBteSBwYXRjaGVzIGFscmVhZHk7
IHBlcmhhcHMgYmlzZWN0IG15IGZ1bGwgcGF0Y2hzZXQgYWdhaW5zdCBkZWZhdWx0IDYuMS1yYzgg
dG8gc2VlIGlmIHRoZXJl4oCZcyBhIOKAmGZpeGluZ+KAmSBjaGFuZ2U/CgpDaHJpc3RpYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
