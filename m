Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D09C7EE22
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 May 2023 20:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8/uWqzgumyuLEb1GRziFO365fjPrVYWRgBgqHUP2HI=; b=Hhqi3WwrvxFikpwYP4WA4r8Hae
	YJXl2YfGdRlOvYFkv+TkhSyD8FKlxsPqvlzWUHzofdO8FMl7L4XDfc396YjIny6XPnjyKDFRMB9Ov
	yZzVFyEJAgryCAd2FjqpKW4IeEEUWAr4NRjkBbB0XjsEYcuoJcFhoZwZKFLzeKBN5EzbIngz05gVn
	sAVBk1TsnoZ9KkWKe7D+MSjCKGQnqEmWfos/p0WnLOAujuaa0dzRfBaoF23aV/pF01+XcJ9eh2RBW
	T/CQY3hNhyf8aOIVap+TnCN9U6vwFjwv0oEAE6JwbM5falnueewwOU4cz7sxxoyfXjH78OCUoBKJJ
	vAUy9TUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIYa-000CbO-0H;
	Sun, 14 May 2023 20:43:04 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIYW-000Cad-1c
	for linux-amlogic@lists.infradead.org;
	Sun, 14 May 2023 20:43:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9660af2499dso1972437666b.0
        for <linux-amlogic@lists.infradead.org>; Sun, 14 May 2023 13:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684096978; x=1686688978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9dvTSlniUVfCaSC8k/L21+kFYYDT3lk/DIP6ENR2s4=;
        b=llVR2huAlUigHQb08k844q7grcjOaj7bgGcET6x54m6ggUHbKoKfvFK2klcfJwnyQg
         mkcpYs2AjkdQHIYlT3kDp1FUxpYXpZAQQ59xW78CTBadgxECpzUp9LoYeBGhTDu1IDGg
         pHPRCsNnUlVx2/9t9Z27i+JVT4+6NrgCxL5Q1mUwcPk1bT+PirfdqRZO9PfrMD7Yx5jq
         3e6Rz4jDI8nAFD6yy0NQ0LuptDF5/Mdc7Bz5DbuxeNI7FelRKk3DIyQZGNMQdgqL79eX
         sLfcUaqi5pUalPOeQiuinNSklPSOgtAHZj3sqNA5OcNnA7RU1LfuIkXwt1RyNxG75Vcu
         yKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684096978; x=1686688978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9dvTSlniUVfCaSC8k/L21+kFYYDT3lk/DIP6ENR2s4=;
        b=ko+ygy23uVVlUSssprhoDu/TvVkkp2UOnRugupLtUkcXIFmSrF3ulE8fLazM2ZKBqp
         yoiLn5KwwaEqfKobRBu08BpBdLo3mHEX1koXDwv4IVCZxU41Up5rkmSgH5QjpuC/6JX1
         67bSBu3N4t5ZsZQyF61nSWGAerx4cjjgoibyGCCj+/hPERwrUcRwFEUUWQmPSm/iTGQL
         fKU8ZgdSGUQJmGo+ODIgeML+HI5GuXGA3+j1fMNo3dePG7M0oUcUOiZ4QAfS85MgwcMt
         Zb3zApBIzOSKzU3xsvWZDBT6fE+pEbxApEBZXSlxZejHoLy8Tbq37VYfwlt6la9YZWVN
         VDHw==
X-Gm-Message-State: AC+VfDxIOKn3SEsVFNDEY2HeVMKUxf9BrMNysiX6J3vXy768w6cW+L/y
	8jAIKKhtLe1mNQ5lNJpub8SpRDTnDOalJEN2/4A=
X-Google-Smtp-Source: ACHHUZ62HeSMNAqKI3//QVu45v+vCwf+3JiHi6LmkZSWBkwJ72pTau2OTKnwJCtyHBLXNCTjitO9qhRwNpG6yc09ffA=
X-Received: by 2002:a17:907:806:b0:953:47fc:3f0b with SMTP id
 wv6-20020a170907080600b0095347fc3f0bmr24871963ejb.53.1684096978431; Sun, 14
 May 2023 13:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com> <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
In-Reply-To: <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 14 May 2023 22:42:46 +0200
Message-ID: <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
Content-Type: multipart/mixed; boundary="0000000000002ac84205fbad6269"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_134300_565889_6B89977E 
X-CRM114-Status: GOOD (  28.65  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--0000000000002ac84205fbad6269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Thu, May 11, 2023 at 12:43=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
[...]
> > Indeed, removing mmc_set_clock() from mmc_select_hs200() also makes my
> > eMMC appear again on top of Linux 6.4-rc1.
> > See the attached diff in case it's not fully clear which
> > mmc_set_clock() call I removed.
>
> Thanks for the update! Removing that call restores mmc_select_hs200()
> to the previous behaviour - so thanks for confirming that this is
> working.
>
> However, to find the proper solution, I think we need to understand
> why we are hanging in the meson-mx-sdhc driver first. Here's a couple
> of follow up questions from me:
>
> 1) Before calling mmc_set_clock() what is the actual clock rate that
> has been set by the meson driver?
>
> 2) Does the call to mmc_set_clock() return or hang? Can we verify that
> the clock gets set correctly?
I used the attached diff to answer these two questions. See the
following log extract (full log is attached):
meson-mx-sdhc c1108e00.mmc: Trying to set MMC clock to 400000Hz
meson-mx-sdhc c1108e00.mmc: Actual MMC clock to 399812Hz
mmc1: mmc_select_hs200 switching to clock from card->ext_csd.hs_max_dtr...
meson-mx-sdhc c1108e00.mmc: Trying to set MMC clock to 52000000Hz
meson-mx-sdhc c1108e00.mmc: Actual MMC clock to 51000000Hz
mmc1: mmc_select_hs200 mmc_set_clock returned

> 3) If 2) seems to work above, we need to figure out why
> mmc_switch_status() is hanging. If there is a problem with the eMMC
> card responding in-correctly, the host driver should return with an
> error code, right?
You're right: it's indeed hanging in mmc_switch_status()
I don't get any interrupts (timeout, CRC error, ...) for it.
Do you have any suggestions what to check next?


Best regards,
Martin

--0000000000002ac84205fbad6269
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="error-prints-to-identify-why-hs200-switch-hangs.diff"
Content-Disposition: attachment; 
	filename="error-prints-to-identify-why-hs200-switch-hangs.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lhnvryoz1>
X-Attachment-Id: f_lhnvryoz1

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2NvcmUvbW1jLmMgYi9kcml2ZXJzL21tYy9jb3JlL21t
Yy5jCmluZGV4IDg5Y2Q0OGZjZWM3OS4uZWYyOTg2ZmY0NTI4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L21tYy9jb3JlL21tYy5jCisrKyBiL2RyaXZlcnMvbW1jL2NvcmUvbW1jLmMKQEAgLTE1MDAsNyAr
MTUwMCwxMSBAQCBzdGF0aWMgaW50IG1tY19zZWxlY3RfaHMyMDAoc3RydWN0IG1tY19jYXJkICpj
YXJkKQogCQlvbGRfdGltaW5nID0gaG9zdC0+aW9zLnRpbWluZzsKIAkJb2xkX2Nsb2NrID0gaG9z
dC0+aW9zLmNsb2NrOwogCQltbWNfc2V0X3RpbWluZyhob3N0LCBNTUNfVElNSU5HX01NQ19IUzIw
MCk7CisJCXByX2VycigiJXM6ICVzIHN3aXRjaGluZyB0byBjbG9jayBmcm9tIGNhcmQtPmV4dF9j
c2QuaHNfbWF4X2R0ci4uLlxuIiwgbW1jX2hvc3RuYW1lKGNhcmQtPmhvc3QpLAorCQkgICAgICAg
X19mdW5jX18pOwogCQltbWNfc2V0X2Nsb2NrKGNhcmQtPmhvc3QsIGNhcmQtPmV4dF9jc2QuaHNf
bWF4X2R0cik7CisJCXByX2VycigiJXM6ICVzIG1tY19zZXRfY2xvY2sgcmV0dXJuZWRcbiIsIG1t
Y19ob3N0bmFtZShjYXJkLT5ob3N0KSwKKwkJICAgICAgIF9fZnVuY19fKTsKIAogCQkvKgogCQkg
KiBGb3IgSFMyMDAsIENSQyBlcnJvcnMgYXJlIG5vdCBhIHJlbGlhYmxlIHdheSB0byBrbm93IHRo
ZQpAQCAtMTUwOCw2ICsxNTEyLDggQEAgc3RhdGljIGludCBtbWNfc2VsZWN0X2hzMjAwKHN0cnVj
dCBtbWNfY2FyZCAqY2FyZCkKIAkJICogdHVuaW5nIHdpbGwgZmFpbCBhbmQgdGhlIHJlc3VsdCBl
bmRzIHVwIHRoZSBzYW1lLgogCQkgKi8KIAkJZXJyID0gbW1jX3N3aXRjaF9zdGF0dXMoY2FyZCwg
ZmFsc2UpOworCQlwcl9lcnIoIiVzOiAlcyBzdGF0dXMgYWZ0ZXIgbW1jX3NldF9jbG9jazogJWRc
biIsIG1tY19ob3N0bmFtZShjYXJkLT5ob3N0KSwKKwkJICAgICAgIF9fZnVuY19fLCBlcnIpOwog
CiAJCS8qCiAJCSAqIG1tY19zZWxlY3RfdGltaW5nKCkgYXNzdW1lcyB0aW1pbmcgaGFzIG5vdCBj
aGFuZ2VkIGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaGMtbW1j
LmMgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaGMtbW1jLmMKaW5kZXggODc5OWY0N2Vk
ZjIzLi4xMDRmMDAyNzU5NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgt
c2RoYy1tbWMuYworKysgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaGMtbW1jLmMKQEAg
LTI3Miw2ICsyNzIsOCBAQCBzdGF0aWMgaW50IG1lc29uX214X3NkaGNfc2V0X2NsayhzdHJ1Y3Qg
bW1jX2hvc3QgKm1tYywgc3RydWN0IG1tY19pb3MgKmlvcykKIAogCW1lc29uX214X3NkaGNfZGlz
YWJsZV9jbGtzKG1tYyk7CiAKKwlkZXZfZXJyKG1tY19kZXYobW1jKSwgIlRyeWluZyB0byBzZXQg
TU1DIGNsb2NrIHRvICV1SHpcbiIsIGlvcy0+Y2xvY2spOworCiAJaWYgKGlvcy0+Y2xvY2spIHsK
IAkJcmV0ID0gY2xrX3NldF9yYXRlKGhvc3QtPnNkX2NsaywgaW9zLT5jbG9jayk7CiAJCWlmIChy
ZXQpIHsKQEAgLTMxNyw2ICszMTksOCBAQCBzdGF0aWMgaW50IG1lc29uX214X3NkaGNfc2V0X2Ns
ayhzdHJ1Y3QgbW1jX2hvc3QgKm1tYywgc3RydWN0IG1tY19pb3MgKmlvcykKIAkJbW1jLT5hY3R1
YWxfY2xvY2sgPSAwOwogCX0KIAorCWRldl9lcnIobW1jX2RldihtbWMpLCAiQWN0dWFsIE1NQyBj
bG9jayB0byAldUh6XG4iLCBtbWMtPmFjdHVhbF9jbG9jayk7CisKIAlyZXR1cm4gMDsKIH0KIApA
QCAtNTYyLDYgKzU2Niw5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtZXNvbl9teF9zZGhjX2lycShp
bnQgaXJxLCB2b2lkICpkYXRhKQogCWlmICghKGljdGwgJiBpc3RhKSkKIAkJcmV0dXJuIElSUV9O
T05FOwogCisJZGV2X2VycihtbWNfZGV2KGhvc3QtPm1tYyksICJDTUQlZCBJU1RBOiAweCUwOHgs
IElDVEw6IDB4JTA4eFxuIiwKKwkJCWNtZC0+b3Bjb2RlLCBpc3RhLCBpY3RsKTsKKwogCWlmIChp
c3RhICYgTUVTT05fU0RIQ19JU1RBX1JYRklGT19GVUxMIHx8CiAJICAgIGlzdGEgJiBNRVNPTl9T
REhDX0lTVEFfVFhGSUZPX0VNUFRZKQogCQljbWQtPmVycm9yID0gLUVJTzsK
--0000000000002ac84205fbad6269
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--0000000000002ac84205fbad6269--

