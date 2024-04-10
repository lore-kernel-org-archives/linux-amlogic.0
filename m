Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C41CD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDj/u61ZAf2OP/4BiYaQxtu6iHKX2MK4ZWJGOFC63d4=; b=pBfjGXeX48KvpVHQ8DTTmTCDeE
	RuMyEsU804R3+WKThe3lX6MuHpx4XXu8W7vmReg69Z/4FS0eXE7RFN2nPbfFlf+qlVni89VxreXsf
	Ggmg2Oap1JfW5yQOm47M72OAyhFbiPZ1tDVa9dU/UZD9fbbJZNSu6Cm/8JnGTadijzM1YaVU5JhoK
	L1Od8AZbgFvKAwDSUl2BconZovrQh/qqs3dADhkx70Msv/oLJumxV87vy4WTsKaaUlIMLAk2ikcLR
	4lGZBQcIEr2ma2E17jwyalbDQ2UjgtFYEpJ2vXNdPbcia1+C4d4xE7CQKM9NIEXxSxGT8rHRdOd07
	eUjEzMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudiz-00000008hjX-1CJf;
	Wed, 10 Apr 2024 19:35:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudiv-00000008hib-494Q;
	Wed, 10 Apr 2024 19:35:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e2b137d666so53001795ad.2;
        Wed, 10 Apr 2024 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1712777708; x=1713382508; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g656SpCYaMp6vFyqsY3OV3wXp/aZxKZhrmXE0IxorBU=;
        b=G+FtMTl/6/nToCYchwwIq18yj0qdhRZOBbfSG0ksZrvjZE2cnMCIHWplP0claPTcil
         OTMzBAjZxElk3BFR8GwCh5ef9SJr24Y8PRuUzfppwB+6cjwqk/e29GoF34iRUKXlOS6Y
         n0ynzE/c/J9DG1rTyg+vOFzv5MuH1tVZQREpjxVHjq6yeIKypjk8avDuKKAHtuagmcxp
         j+uMOvFWd8w8idvIsSPRvvS1YpmIycVB0tkDaFMdgTxLRNxnsps96mpliqNwPKYQ5clf
         w8igXgxCPPO5CekZg7b5HAJXnyN4TBjVT628olTby9xq6Rl8bWus8iqKNyc8zzh4Ooeo
         GDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712777708; x=1713382508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g656SpCYaMp6vFyqsY3OV3wXp/aZxKZhrmXE0IxorBU=;
        b=ODm6gl8li7o9+2KoTHEtyfniX/HGOs44IJCIm+Eay6hkN7uOnMqSTcrvrlGMiwTOsb
         WHDBMMgmM64mavbpYUPBx6O4Zm8k7YnvPJUya62z9A12vfs58vlat27fUgnle8Hk+ddr
         PEsGugh5baTz+bYqugE0n46xgd59RfUVsqZX/hgFJzu9oPmg4bp+fSIswcqsSGqLVtzr
         94KzwGMyHSFUMcvWAip8AtvITm1d8EEwk1ZGnyFshCpWpb90PwSd+MYoXgbJMpnjV2cg
         9v07ivTFSCgWsV7EXBZ4RQOt+BjJIhQo+WiUvDaThvB8GfPxv6BlcNEu+JgZ7FtzS83B
         oFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ALXvueNcsR0raEVa0jXWbCAokPxNdn6IYlMKWbm9glFsIKiB8dLso1ExVwmHWW8FbDiBABv+VHDrqboOwDBZ9mtADsPM0D78fNSuqf9Onn3MQcqgILW6iJYUDR+JhIPk4sTt1jdY8cMmLQ4Ns7HN9wd6t66O8g==
X-Gm-Message-State: AOJu0YzStskb5Kz1lqeOVHnoq9UljPPyR3K3FNK17kTgfz2YaDi0MDN3
	4zBB1aN8itDqwm3KwfVwtUnVhBwaWfwCh4tIWFIAJdYRvdYinWwVGi35TaXJWZ96jMN+6OdLyAe
	jXX04irUoqQPJ/HlOMy4+Bd/mJs4=
X-Google-Smtp-Source: AGHT+IFG4wZy5xKqrBbd0+jyKIYfyDkXeatsz1RW1t4MoepWhKG5fO6dMM+S5nhn7lThAmtFHKQqa2845byFu2CtKgU=
X-Received: by 2002:a17:902:ce06:b0:1e3:cd26:cf16 with SMTP id
 k6-20020a170902ce0600b001e3cd26cf16mr5200823plg.51.1712777707736; Wed, 10 Apr
 2024 12:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 Apr 2024 21:34:56 +0200
Message-ID: <CAFBinCChEc+GH+tdmByWDM=Gs_BUpDh=6S=ch3QbGUt501_Ejw@mail.gmail.com>
Subject: Re: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000d9789e0615c322c7"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_123510_145778_EF5579BD 
X-CRM114-Status: GOOD (  32.31  )
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

--000000000000d9789e0615c322c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, Apr 3, 2024 at 9:46=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> Disable the px_clk when setting the rate to recover a fully
> configured and correctly reset VCLK clock tree after the rate
> is set.
>
> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/=
meson/meson_dw_mipi_dsi.c
> index a6bc1bdb3d0d..a10cff3ca1fe 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>                 return ret;
>         }
>
> +       clk_disable_unprepare(mipi_dsi->px_clk);
nit-pick: clk_disable(mipi_dsi->px_clk); should be enough here as my
understanding is that we only need to {un,}prepare a clock once.

>         ret =3D clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 10=
00);
>
>         if (ret) {
> @@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>                 return ret;
>         }
>
> +       ret =3D clk_prepare_enable(mipi_dsi->px_clk);
> +       if (ret) {
> +               dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock =
(ret %d)\n", ret);
> +               return ret;
If we ever hit this error case then there will be a lot of additional
errors in the kernel log:
- initially the clock is prepared and enabled in
meson_dw_mipi_dsi_probe() by calling devm_clk_get_enabled()
- we then disable the clock above (generally disabling a clock is
expected to always succeed)
- if the clock can NOT be re-enabled here we just log the error
- in case a user tries to rmmod the driver (to modprobe it again) to
try and recover from an error the automatic disabling of the pix_clk
(based on devm_clk_get_enabled() where it was enabled initially) there
will be a splat because the clock is already disabled (and enabled
count is zero, so it cannot be disabled any further)

For the 32-bit SoC video clocks I keep track of them being enabled or
disabled, see [0], [1] and [2].
In my case this is important because we can run into cases where the
PLL doesn't lock (I am not sure how likely this is for your case).

It *seems* like we need to do something similar as
dw_mipi_dsi_phy_init() can be called when changing the display
resolution (or whenever drm_bridge_funcs.atomic_pre_enable) is called.
To illustrate what I have in mind I attached a diff (it's based on
this patch) - it's compile tested only as I have no DSI hardware.
In case dw_mipi_dsi_phy_init() is called only once per device
lifecycle things may get easier.

PS: I'm so happy that we don't need any clock notifiers for this!
So: good work with the clock driver bits.


Let me know what you think,
Martin


[0] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240=
323/drivers/gpu/drm/meson/meson_vclk.c#L1177-L1179
[1] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240=
323/drivers/gpu/drm/meson/meson_vclk.c#L1077
[2] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240=
323/drivers/gpu/drm/meson/meson_vclk.c#L1053

--000000000000d9789e0615c322c7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="meson_dw_mipi_dsi-clk-disable-enable.diff"
Content-Disposition: attachment; 
	filename="meson_dw_mipi_dsi-clk-disable-enable.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_luu7g3we0>
X-Attachment-Id: f_luu7g3we0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21pcGlfZHNpLmMKaW5kZXggYTZiYzFiZGIz
ZDBkLi45MjY2MThkMGU2MjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kd19taXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBp
X2RzaS5jCkBAIC00Niw2ICs0Niw3IEBAIHN0cnVjdCBtZXNvbl9kd19taXBpX2RzaSB7CiAJc3Ry
dWN0IGNsayAqYml0X2NsazsKIAlzdHJ1Y3QgY2xrICpweF9jbGs7CiAJc3RydWN0IHJlc2V0X2Nv
bnRyb2wgKnRvcF9yc3Q7CisJYm9vbCBweF9jbGtfZW5hYmxlZDsKIH07CiAKICNkZWZpbmUgZW5j
b2Rlcl90b19tZXNvbl9kd19taXBpX2RzaSh4KSBcCkBAIC04Nyw2ICs4OCwxMSBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKIAkJcmV0dXJuIHJldDsK
IAl9CiAKKwlpZiAobWlwaV9kc2ktPnB4X2Nsa19lbmFibGVkKSB7CisJCWNsa19kaXNhYmxlKG1p
cGlfZHNpLT5weF9jbGspOworCQltaXBpX2RzaS0+cHhfY2xrX2VuYWJsZWQgPSBmYWxzZTsKKwl9
CisKIAkvKiBNYWtlIHN1cmUgdGhlIHJhdGUgb2YgdGhlIGJpdCBjbG9jayBpcyBub3QgbW9kaWZp
ZWQgYnkgc29tZW9uZSBlbHNlICovCiAJcmV0ID0gY2xrX3JhdGVfZXhjbHVzaXZlX2dldChtaXBp
X2RzaS0+Yml0X2Nsayk7CiAJaWYgKHJldCkgewpAQCAtMTAzLDYgKzEwOSwxNCBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKIAkJcmV0dXJuIHJldDsK
IAl9CiAKKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUobWlwaV9kc2ktPnB4X2Nsayk7CisJaWYg
KHJldCkgeworCQlkZXZfZXJyKG1pcGlfZHNpLT5kZXYsICJGYWlsZWQgdG8gZW5hYmxlIERTSSBQ
aXhlbCBjbG9jayAocmV0ICVkKVxuIiwgcmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwltaXBp
X2RzaS0+cHhfY2xrX2VuYWJsZWQgPSB0cnVlOworCiAJc3dpdGNoIChtaXBpX2RzaS0+ZHNpX2Rl
dmljZS0+Zm9ybWF0KSB7CiAJY2FzZSBNSVBJX0RTSV9GTVRfUkdCODg4OgogCQlkcGlfZGF0YV9m
b3JtYXQgPSBEUElfQ09MT1JfMjRCSVQ7CkBAIC0yODcsNyArMzAxLDcgQEAgc3RhdGljIGludCBt
ZXNvbl9kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIlVuYWJsZSB0byBnZXQgZW5hYmxlZCBiaXRf
Y2xrXG4iKTsKIAl9CiAKLQltaXBpX2RzaS0+cHhfY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
ZGV2LCAicHgiKTsKKwltaXBpX2RzaS0+cHhfY2xrID0gZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKGRl
diwgInB4Iik7CiAJaWYgKElTX0VSUihtaXBpX2RzaS0+cHhfY2xrKSkKIAkJcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCBQVFJfRVJSKG1pcGlfZHNpLT5weF9jbGspLAogCQkJCSAgICAgIlVuYWJs
ZSB0byBnZXQgZW5hYmxlZCBweF9jbGtcbiIpOwpAQCAtMzI3LDYgKzM0MSw5IEBAIHN0YXRpYyB2
b2lkIG1lc29uX2R3X21pcGlfZHNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBtZXNvbl9kd19taXBpX2RzaSAqbWlwaV9kc2kgPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKIAorCWlmIChtaXBpX2RzaS0+cHhfY2xrX2VuYWJsZWQpCisJCWNsa19k
aXNhYmxlKG1pcGlfZHNpLT5weF9jbGspOworCiAJZHdfbWlwaV9kc2lfcmVtb3ZlKG1pcGlfZHNp
LT5kbWQpOwogfQogCg==
--000000000000d9789e0615c322c7
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--000000000000d9789e0615c322c7--

