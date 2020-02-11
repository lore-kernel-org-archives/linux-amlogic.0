Return-Path: <SRS0=emJG=37=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4D4C352A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Feb 2020 12:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D39720842
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Feb 2020 12:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L8Hd1jW1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W1+92dCh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D39720842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qUWdyENsN0ws2O98qhvoJOtFVdNXcBevSIG/5H3m8LQ=; b=L8Hd1jW1NTF2Sj2uIh+64GHIQX
	0qilabho4VFY6EZ4vd+Zk3ZSxwDlVBvykjaBxik6MI24N4M4uIUJKLhJBpKWVLroNnCeTPeh/pcWf
	E8efkMEALn4++eWeXSSpVlqUM7Z0CELkMftDhRHKNr1ITwZxsxlxddUUfoqqZsdhdctWOD00HOOcL
	9pScHQVpusmeyNsk3JF4Txrwn/bNFt2acezgLMs+THJIldAfChYtt4Mjl9NVCXirJ8JxiIlP/gHhG
	MLTjB1WPzJRkoIV/THZ5UmWbU7Q/FfAsO0kgvb1Ww2anE5jANYXW78wjIwPi1OnqF9s1WAeX0TZFd
	18xyhGJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1UT0-000781-6F; Tue, 11 Feb 2020 12:16:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1USx-00076u-2w
 for linux-amlogic@lists.infradead.org; Tue, 11 Feb 2020 12:16:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id r11so8854360wrq.10
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Feb 2020 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=GUGVeWyTamE7UDj1FKSQ+oAogvWYH8rVlMddW6H23bo=;
 b=W1+92dChYL38m0QO++WYETYen2Fxo5eUiRgk2TXSr9E1riiBm5WQ5epUQwHBYgg5Q4
 Fgj6CeZHrKZuTII/KbyWNpNova/3fm1WK1YB+EWM8MuFQoeiwyXsLJu0xxmMw9kbhEL4
 N+BG29zaELbKteYXpKNUVouXWqrCxd5WW3WFjRtmzzSrfidgwlKwdgtgeFF3LLuBCshQ
 NsNnPCC8kBXMywXCzzhUC8bhTGFWah1fLdtCgVoXTbrQBFhSImu2zH4Mi9an7sS70ecf
 guw+cYpi5JzNhlxU5nEkl4Bn6jGt9i+ZXNRTWOE0w9X/DDON7Hc1CAW1ZmHeiLROLJ7U
 CTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=GUGVeWyTamE7UDj1FKSQ+oAogvWYH8rVlMddW6H23bo=;
 b=W6RD3mr1sOS3MdN+qqCyWtLwR73v4UK7jja3PUpGDO9g2scVt8r/N1am3ARMYh48n2
 3ZmrH7NbkU7fROxC3enX3JxkLMEdYpN198Lc+KrUJckGmXBr3oVQrpL8vekFAf6/76vV
 MQrbjMOWyGZMFLoI2/WzS3uS6q0tbba5olSZtaBRlzi1d68kPx0nP9eKJCmZX9AmNeJg
 ZCsezvN+8lju9CA3qPnHPX17ZBOwLko9E09ZtIAnw/eFwEtNfs2IaLrQZr2M8Irv6UHT
 wk75g3CmTqmnhlJS+khRdn3S6QRtYNoqOgNEJFt3QkxpKeKZ/zjcbQc9PeUnNvyJqgGt
 2imQ==
X-Gm-Message-State: APjAAAV3wzpO57Yw8lb4CYz6j0Texb9ZBym9bxXehsObpFCMJywuTVQu
 KXcYk3R9E08fdZPLwHpF46/MGw==
X-Google-Smtp-Source: APXvYqwfT/nPvnV/mY2Ya9vBY1B2CXqBG3HndSvJlIoc9nkQdXy7phO8sDESz0qr6Hw1YB1/L4rIrw==
X-Received: by 2002:adf:82ce:: with SMTP id 72mr8363015wrc.14.1581423391418;
 Tue, 11 Feb 2020 04:16:31 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c4sm3446467wml.7.2020.02.11.04.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:16:30 -0800 (PST)
References: <1581419454-12667-1-git-send-email-hanjie.lin@amlogic.com>
 <1581419454-12667-2-git-send-email-hanjie.lin@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Hanjie Lin <hanjie.lin@amlogic.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kevin
 Hilman" <khilman@baylibre.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
In-reply-to: <1581419454-12667-2-git-send-email-hanjie.lin@amlogic.com>
Date: Tue, 11 Feb 2020 13:16:29 +0100
Message-ID: <1jpnelb9pe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_041635_133142_B925BE86 
X-CRM114-Status: GOOD (  10.02  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Victor
 Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-usb@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 11 Feb 2020 at 12:10, Hanjie Lin <hanjie.lin@amlogic.com> wrote:

> Add the Amlogic A1 Family USB2 PHY Bindings
>
> It supports Host mode only.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
> index 57d8603..3b7e763 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-g12a-usb2-phy
> +      - amlogic,meson-a1-usb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -49,6 +50,20 @@ required:
>    - reset-names
>    - "#phy-cells"
>  
> +allOf:

Is 'allOf' really needed when there is only one if clause ?

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-a1-usb-ctrl
> +
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +      required:
> +        - power-domains
> +
>  examples:
>    - |
>      phy@36000 {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
