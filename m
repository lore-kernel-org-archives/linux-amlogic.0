Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC58C46CD3
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 00:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knKZO1p67pwr5BGBgbnOwVtaWid+4AAR+1qalhcuCes=; b=3s2c5yxgYcYHCVbPkj5Uzf5LmV
	IXdEXYnIKWvp1FDTXnVIKOQagjYWtr1OezdkIlPPRWLjbxXXumZu/d4jctgqkrrtFXhnt9IYUoiNg
	LJ2CH6/8zd8HhPu/za1CbPvYrrZkKvq7Iy/UC1KBXgTno2bXVl83ApudVQgB5v4vo3Ocey2264yGO
	E+8PIfaaQuy9ibrgkejOFgZqB02V1TA8g7i/JZiSBt2sDtOMXIBSO/T+Uh4AnVxbQK1vCxH3gZdQ6
	AlQpdBZl4LDrzYt75zsxNPVhvSK+GraFKmtJoNquFAKIz4fIAZplp6CrVO9gicM01w5gtmFCWq1xY
	hCpp/chg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTEm-004V2Q-15;
	Fri, 22 Dec 2023 00:18:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTEj-004V1N-1M
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 00:17:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d3f29fea66so9719525ad.3
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Dec 2023 16:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1703204276; x=1703809076; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4eLtecU1AzkZ6v0yoRfkSekFdqon4FA+IB17UNyBZc=;
        b=U8VA+d5wdEbcPaUZe0KEnnfy6aL+u3/q6nwLg72nqSUcddYTArKcUu9gegvR9q5dJU
         UbARpmYxjyI6FmgJiGhjBHbaetfi505F8gjcJ8ezepXQDs0KzUqdfpZvdR9qqYaA8ciK
         ejPd2pysX1udkmfWvlC0EzpNdVAV5job9v+aAMpqF7vU+7maNJ6Ew2RIGsJ2UaERNGsW
         fcv10aibzvFjA7KIdvkNoxEQhHVPbeJzLhv9KlohdLbd2i95EaZZXspedTsqzG0I7h/J
         06887lFKNgaggtpYM3VfxWa0eIdLU1SsEQhosWczhYwR0bMW3ULfcGECMcEivt068uaE
         Y9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703204276; x=1703809076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4eLtecU1AzkZ6v0yoRfkSekFdqon4FA+IB17UNyBZc=;
        b=iy3vY56NTgZDpKph4/vCI9buTNlaBh9O00pUWWiZZMQSvri2wpToFmTuEbfHxtXB1N
         hDfPDzYgtFkjuB94TZmv83vqmvX6xmfkMALdYAxRSr/ZdHpl/VEKuhUPPXalVDp6oFOp
         wNtpEJsMD37c3bEV3fd9x96uLJbriJq6PK7EfUJDT1MmyNKKVjOjDxNJfOqEi7UiXmlM
         358ilbHBEuqqm9iSQ5PoKfpsYGbnthnX5GwmP6IuIZsPcooDehDYdtDuHf+kT7PFk1QI
         1BPzaUh3uF3oq2p9fWrl4huxUbBErSx1oPLYaN5sRUnzNZOT8LmilIBdwVTK4jJGg1RU
         w79g==
X-Gm-Message-State: AOJu0Yzja4ax7HGMk/yN+0CSyHg/MIEXJ4Cn9y810PzUDn9SPQWCSt1L
	d1PJ2Tu3xK8BhCwuaHVB8qQCW5D/GqW0m3HfQDo=
X-Google-Smtp-Source: AGHT+IHogtZ5maciBE+Gv1/Y3tNb1CAhSD7rJLIduNEIGjOjhD1j6XdGgzYPCtZ3MPpkJXKPikbhw9V3CGgvQTtBDqc=
X-Received: by 2002:a17:902:7c95:b0:1d0:9609:382e with SMTP id
 y21-20020a1709027c9500b001d09609382emr300415pll.21.1703204275514; Thu, 21 Dec
 2023 16:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com> <tek6c6symqgm6x6ujh4m67q32en24pzrkjbchffir7qljo4gor@7qpu4zmgyzpq>
In-Reply-To: <tek6c6symqgm6x6ujh4m67q32en24pzrkjbchffir7qljo4gor@7qpu4zmgyzpq>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 22 Dec 2023 01:17:44 +0100
Message-ID: <CAFBinCAxh0xU2mDRX3t42j6oJ534p9RPUV+dYoRe0oacTw_7iA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Content-Type: multipart/mixed; boundary="000000000000d28aac060d0e2533"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_161757_481250_E7650BD1 
X-CRM114-Status: GOOD (  20.03  )
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

--000000000000d28aac060d0e2533
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Thu, Dec 21, 2023 at 11:03=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
[...]
> Note this isn't save in general. You're implicitly assuming that a
> disabled PWM runs with the minimal supported duty_cycle. Most disabled
> PWMs yield the inactive level (which corresponds to a 0% relative duty
> cycle). But there are exceptions.
Good catch - thank you!

[...]
> Without claiming to understand all implications, I'd say
> pwm_regulator_get_voltage should signal to the caller when the
> duty_cycle isn't contained in [min(max_uV_duty, min_uV_duty),
> max(max_uV_duty, min_uV_duty)].
It seems like there's -ENOTRECOVERABLE that we can signal to the caller.
This makes the following message appear in my kernel log:
  VDDEE: Setting 1100000-1140000uV
Which means that pwm_regulator_set_voltage() is called which will then
pick the minimum voltage.

To make this work I will need to update meson8b-odroidc1.dts (which
isn't a problem, I just want to point it out as it's mandatory for
that solution. also I will send that in a separate patch).

See my attached patch (which replaces the initial patch I sent, it's
not meant to be applied on top).
One question that I still have is whether we are allowed to just
enable the PWM output within pwm_regulator_set_voltage().
Doing so is actually mandatory, otherwise we end up in an infinite
loop of not being able to read the voltage, then sets the minimum
voltage (but leaves the PWM output disabled) which then means that it
can't read back the voltage which means it tries to set the minimum
voltage ....


Best regards,
Martin

--000000000000d28aac060d0e2533
Content-Type: text/x-patch; charset="US-ASCII"; name="odroidc1-vddee-fix-to-discuss.diff"
Content-Disposition: attachment; 
	filename="odroidc1-vddee-fix-to-discuss.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lqfvouez0>
X-Attachment-Id: f_lqfvouez0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtbG9naWMvbWVzb244Yi1vZHJvaWRjMS5k
dHMgYi9hcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uOGItb2Ryb2lkYzEuZHRzCmluZGV4
IGIwMzI3M2Q5MGFkOC4uZGYzNDhlMTE5NjQzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0
cy9hbWxvZ2ljL21lc29uOGItb2Ryb2lkYzEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb244Yi1vZHJvaWRjMS5kdHMKQEAgLTIxNywxMyArMjE3LDEzIEBAIHZkZGVlOiBy
ZWd1bGF0b3ItdmRkZWUgewogCQljb21wYXRpYmxlID0gInB3bS1yZWd1bGF0b3IiOwogCiAJCXJl
Z3VsYXRvci1uYW1lID0gIlZEREVFIjsKLQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8ODYw
MDAwPjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTEwMDAwMD47CiAJCXJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDExNDAwMDA+OwogCiAJCXB3bS1zdXBwbHkgPSA8JnA1djA+Owog
CiAJCXB3bXMgPSA8JnB3bV9jZCAxIDEyMjE4IDA+OwotCQlwd20tZHV0eWN5Y2xlLXJhbmdlID0g
PDkxIDA+OworCQlwd20tZHV0eWN5Y2xlLXJhbmdlID0gPDE0IDA+OwogCiAJCXJlZ3VsYXRvci1i
b290LW9uOwogCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1
bGF0b3IvcHdtLXJlZ3VsYXRvci5jIGIvZHJpdmVycy9yZWd1bGF0b3IvcHdtLXJlZ3VsYXRvci5j
CmluZGV4IDMwNDAyZWUxODM5Mi4uY2I0ZTVmYWQ1NzAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Jl
Z3VsYXRvci9wd20tcmVndWxhdG9yLmMKKysrIGIvZHJpdmVycy9yZWd1bGF0b3IvcHdtLXJlZ3Vs
YXRvci5jCkBAIC0xNTYsMTMgKzE1NiwxMCBAQCBzdGF0aWMgaW50IHB3bV9yZWd1bGF0b3JfZ2V0
X3ZvbHRhZ2Uoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYpCiAJdW5zaWduZWQgaW50IHZvbHRh
Z2U7CiAKIAlwd21fZ2V0X3N0YXRlKGRydmRhdGEtPnB3bSwgJnBzdGF0ZSk7CisJaWYgKCFwc3Rh
dGUuZW5hYmxlZCkKKwkJcmV0dXJuIC1FTk9UUkVDT1ZFUkFCTEU7CiAKLQlpZiAocHN0YXRlLmVu
YWJsZWQpCi0JCXZvbHRhZ2UgPSBwd21fZ2V0X3JlbGF0aXZlX2R1dHlfY3ljbGUoJnBzdGF0ZSwg
ZHV0eV91bml0KTsKLQllbHNlIGlmIChtYXhfdVZfZHV0eSA8IG1pbl91Vl9kdXR5KQotCQl2b2x0
YWdlID0gbWF4X3VWX2R1dHk7Ci0JZWxzZQotCQl2b2x0YWdlID0gbWluX3VWX2R1dHk7CisJdm9s
dGFnZSA9IHB3bV9nZXRfcmVsYXRpdmVfZHV0eV9jeWNsZSgmcHN0YXRlLCBkdXR5X3VuaXQpOwog
CiAJLyoKIAkgKiBUaGUgZHV0eWN5Y2xlIGZvciBtaW5fdVYgbWlnaHQgYmUgZ3JlYXRlciB0aGFu
IHRoZSBvbmUgZm9yIG1heF91Vi4KQEAgLTIyMSw2ICsyMTgsNyBAQCBzdGF0aWMgaW50IHB3bV9y
ZWd1bGF0b3Jfc2V0X3ZvbHRhZ2Uoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYsCiAKIAlwd21f
c2V0X3JlbGF0aXZlX2R1dHlfY3ljbGUoJnBzdGF0ZSwgZHV0eWN5Y2xlLCBkdXR5X3VuaXQpOwog
CisJcHN0YXRlLmVuYWJsZWQgPSB0cnVlOwogCXJldCA9IHB3bV9hcHBseV9zdGF0ZShkcnZkYXRh
LT5wd20sICZwc3RhdGUpOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycigmcmRldi0+ZGV2LCAiRmFp
bGVkIHRvIGNvbmZpZ3VyZSBQV006ICVkXG4iLCByZXQpOwo=
--000000000000d28aac060d0e2533
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--000000000000d28aac060d0e2533--

