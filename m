Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6F2CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Oct 2025 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/ej4cN6Vs7wY7jTaPKa5nkvl2cB/+bE68SyOAmCa4U=; b=GQMyzNpmyEOQGwwWW3hfyP23nG
	7tkFClIEHqrA0lO74pmpXS1578fEfLtAlxvA7TA8SXk1KVTR6dIfXbmH3lanURj63oB3Qcpo6O030
	ZPytLdHvnjLBpK/U12yKZWB12wVE7mk1GcsQCp20XDaK9uaRI9QiABw6opO6h/ShCDVrzJ3Vzci3J
	HTFUVdZ2G0fXL2DhqyGtbUTIIayFw2+rXO66Za1NiNVTNlQ3Fu7zz6a4gOX8EP1JMiC61X43qUY47
	fHlUMUiRwuEGysqMKKYaJXcgfUstbDlyp1g0m4+Q0nnhIBLZaxK7MdYLLe+EaWmlnpt6RVAS89uDD
	xHh0QJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58mL-0000000Dzr6-3TBD;
	Sat, 04 Oct 2025 20:22:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58mJ-0000000DzqJ-153c
	for linux-amlogic@lists.infradead.org;
	Sat, 04 Oct 2025 20:22:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-27edcbbe7bfso52590615ad.0
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Oct 2025 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759609370; x=1760214170; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7iOjCRTv/UOLRas4QoQfI+GQphzTaP2e17HJMdbYUcY=;
        b=KQJUvR99vK/kRD/+Zs6GqW3wSgl/zh6nmdmti+F6d/GOReQPGifAStVDLjRZruEvxE
         LgxnMFgjAuVOAo2lAwC7/3svQZO7+anILwuSwP1R2fBZdIclgNr33W+QjvnkGUcnC1vV
         BW6r5kHsUhuxJcXTYzUJ3UwpM84RZyT0MmwHeMHfUrhlGgWgAxBKTBBRXcF4Jfcrqp40
         21NlyhEZgYaNrGoFl5mVIsL4h/gsg5JEhooLRBoo1OyEwaObMKT5SilY1MkXXISK6x6M
         uq4QclV3vhj9zYCQOkfz1UY6dr+2UK7cwQtfkJ2sKl1MKIyGh67t6Led6bNdXXFpOD1I
         0aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759609370; x=1760214170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iOjCRTv/UOLRas4QoQfI+GQphzTaP2e17HJMdbYUcY=;
        b=aZjBq2zQuXqT2XgycN5AdoVbCvvW0xUoM5mj3goncT5rp0mG9PLQGnTBvo/HRsq9Tq
         QHomr9pSIduIXXvDWFD/5EzbOBwZIkUL+9282NcLoHCFEBWuJ2W7Kxbh9TJfA/2LFZd7
         Pllge0jd7Z8zBXBcx7mBc+KoxaUv5eOcYKy6jac0Be/k9AQZwXyevv9ThDMYX58wV72h
         vx5HuxshzLTua0rtrCfViiboP3UNMlnRUSfZDB5Xa0R8UuhEjPMATMJdCbzn/h6IuUYF
         CpIxhuSh0Ci+0FWdqy47EZ8DPcI9PASBuL6prJJspIY8c8km42tw9qBxALuDyNnpNGej
         LY/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3Bu9Wkl9jlXQMO0GfVH77A4M7Hi+BL1x7iT/mAoshIxoOS9NcCVDDozNoKhoPgADieDPXn2kui7eT0JYb@lists.infradead.org
X-Gm-Message-State: AOJu0YxulO4hyzsAcfbAVQ1i1VIK13RKlHXJEZH2e3I5AN0TikaEOc9L
	ZdZCiqdDeQeF3aCWbdPYwKfYBn6Gdd0nVrKc3/XEZsNqiqFeiOdWT8cfvTvIT2zDYUtRbNB5Gio
	Qbbd3nh9mGNyA0RYlbJJccvIuFM+pzUlT5d8W
X-Gm-Gg: ASbGncsFHkqyheOHm6dLoyO2XYqEnlTMgpqubYfNdJefS7Sii8O4zPCDUFnaPpbCp+o
	p4aPOdB06jLKRoA/3c1uPYv9c6W/2qjM4gfNDTKgY03syZYaBrPldR92ZiCJ+xqAxVcGLAxUj+F
	oXjrDNpRNKDq3A6IbTeGIJ6I4DfcjXLLta3UcDMUVl60lLELzzqdpmOMwpG0sRLfraD3LzmYkyf
	OGMdtrpy4LInSFCMiYF3MbzoWA6rK7I/qUECawv1LSpxDTbOK+JRCBwfFhDrFJIuZJyY4KAOag=
X-Google-Smtp-Source: AGHT+IEvFiFYb/yXN2Hbuqa0QsBGFUfYWmFw0Mzqwu753oWhqXU6HdGuLh/esJRyH1nG43WsG1wWRCjs/qzkq/JOeVw=
X-Received: by 2002:a17:903:8cc:b0:269:b6c8:4a4b with SMTP id
 d9443c01a7336-28e9a56172amr94357475ad.6.1759609370443; Sat, 04 Oct 2025
 13:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com> <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
In-Reply-To: <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 22:22:38 +0200
X-Gm-Features: AS18NWDKVbe_cLdtewuohc2z1hdjWwhtLw5dUx7qZDgCz70wIOVm6d51SxXp1TM
Message-ID: <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
To: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dongjin Kim <tobetter@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000007818c506405afb9c"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_132251_312195_FAE9DDF5 
X-CRM114-Status: GOOD (  30.18  )
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

--0000000000007818c506405afb9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, Sep 29, 2025 at 1:58=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> > On 29 Sep 2025, at 1:24=E2=80=AFam, Martin Blumenstingl <martin.blumens=
tingl@googlemail.com> wrote:
> >
> > Hi Christian,
> >
> > On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
> > <christianshewitt@gmail.com> wrote:
> > [...]
> >> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv=
,
> >>                        m =3D 0xf7;
> >>                        frac =3D vic_alternate_clock ? 0x8148 : 0x10000=
;
> >>                        break;
> >> +               case 4830000:
> >> +                       m =3D 0xc9;
> >> +                       frac =3D 0xd560;
> >> +                       break;
> > Initially I thought this was wrong because it's only added for the
> > G12A (which is also used on G12B and SM1) code-path, leaving out the
> > GX SoCs.
> >
> > Was the 2560x1440 mode tested on a computer monitor or a TV?
> > I suspect it's the former, so I think it expected the code to take the
> > MESON_VCLK_TARGET_DMT path, which automatically calculates m and frac.
> >
> > I'll give it a try on Friday as I do have a computer monitor with that
> > resolution - so any hints for testing are welcome!
>
> The original patch is from Hardkernel sources - I=E2=80=99ve picked it se=
veral
> years ago and then updated values semi-recently after 1000ULL changes.
> The user who originally requested that I cherry-pick it (and tested it)
> was using an Odroid N2+ board (G12B) with a Dell monitor IIRC. It=E2=80=
=99s not
> tested by myself as I only have TV=E2=80=99s not monitors, so it will be =
good
> to have your confirmation (either way). If it=E2=80=99s wrong I=E2=80=99l=
l be happy to
> drop it - I=E2=80=99m just trying to upstream and offload some longer-run=
ning
> and allegedly good patches in the LibreELEC kernel patchset.
So I've tried it on a Le Potato (S905X SoC) board. This patch doesn't
do anything here (as expected, since it only targets the G12A and
later code-path).

Doing some more analysis, it seems that
meson_venc_hdmi_supported_mode() simply prevents using any mode with
more than 1920 pixels.
I attached a simple patch to overcome this (discarding any
meson_vclk.c changes):
$ cat /sys/class/drm/card1-HDMI-A-1/modes
2560x1440
2048x1152
1920x1200
1920x1080
...

My monitor's OSD tells me that I'm running at 2560x1440@60Hz.

@Neil, should we bump the limits in meson_venc.c to "4Kx2K@60" (that's
a quote from both, S905/GXBB and S905D3/SM1 datasheets), most likely
meaning: 4096x2160?


Best regards,
Martin

--0000000000007818c506405afb9c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="meson_venc-hdmi-support-1440p-screen.diff"
Content-Disposition: attachment; 
	filename="meson_venc-hdmi-support-1440p-screen.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mgcps9pr0>
X-Attachment-Id: f_mgcps9pr0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCmluZGV4IDNiZjBkNmU0ZmMzMC4uOGExMTEwMzc3
YTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKQEAgLTg2OCwxMCArODY4LDEwIEBA
IG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZSkKIAkJCSAgICBEUk1fTU9ERV9GTEFHX1BWU1lOQyB8IERSTV9NT0RFX0ZMQUdf
TlZTWU5DKSkKIAkJcmV0dXJuIE1PREVfQkFEOwogCi0JaWYgKG1vZGUtPmhkaXNwbGF5IDwgNDAw
IHx8IG1vZGUtPmhkaXNwbGF5ID4gMTkyMCkKKwlpZiAobW9kZS0+aGRpc3BsYXkgPCA0MDAgfHwg
bW9kZS0+aGRpc3BsYXkgPiAyNTYwKQogCQlyZXR1cm4gTU9ERV9CQURfSFZBTFVFOwogCi0JaWYg
KG1vZGUtPnZkaXNwbGF5IDwgNDgwIHx8IG1vZGUtPnZkaXNwbGF5ID4gMTkyMCkKKwlpZiAobW9k
ZS0+dmRpc3BsYXkgPCA0ODAgfHwgbW9kZS0+dmRpc3BsYXkgPiAyNTYwKQogCQlyZXR1cm4gTU9E
RV9CQURfVlZBTFVFOwogCiAJcmV0dXJuIE1PREVfT0s7Cg==
--0000000000007818c506405afb9c
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--0000000000007818c506405afb9c--

