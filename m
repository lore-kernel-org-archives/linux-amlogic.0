Return-Path: <SRS0=jkUD=O7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7C4C43444
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Dec 2018 17:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EDC321B6B
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Dec 2018 17:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQtnDyqt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QhR58r5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EDC321B6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CMjS3KNhlNcjeprHKqy6zLulqdwgKgurZbltSw2BWQ=; b=XQtnDyqt4g0jWo
	19WOwgTHFOdMB5BQRfc9v3LWR+sEO0kpiH0K7VmS4ewNTWwxS6QYt7dNc/F0OTJNyLVjdIFvU5L3a
	5GaimjEvDJHyXj+7IdN7bNu81lQinafesp5sdqprvtGfyOSP2Ubvgmn8OA9f3GUIdlaVrc7w6D0r3
	AY20KzdXFOJo5pe2ZglJ/RSP096/tntvmmOfHzAOhd1kGeImtgA0taVn478630CczqsGrvtYfXHGY
	LMgb3Cpf7/iRF1OudpCfDMFqNp79ir9zkBZ79ZdDfXeDQepaK+kydFTIFk6cOv1aWw80wiEWnckwr
	NXVUTFvbVGDCogNC23XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gakek-0006P2-L2; Sat, 22 Dec 2018 17:01:42 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gakei-0006NX-4R
 for linux-amlogic@lists.infradead.org; Sat, 22 Dec 2018 17:01:41 +0000
Received: by mail-ot1-x344.google.com with SMTP id f18so7879454otl.11
 for <linux-amlogic@lists.infradead.org>; Sat, 22 Dec 2018 09:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymXbQn4yh640Md6ALwIiwWx/ogGOI+5wQMm4YP9kOu4=;
 b=QhR58r5R7kwV9P3mQBtR3YCduxyw9gz2mKx6PepVhPV1lQkGoIAsg7ekUHcLCcVIZt
 fYNc83pspJbYeA+hJxUZ2xkZz+jtJu/nKwvx7at3dK+3Cwm/04L5CYcHIPuwcqyUGcAo
 wLS6Qhz0Vzrv7riGc3vB+8m3+Ot5GsvR+BD1pYbO/2J4ZhOdDED/Jp813hPUP69V2ZYD
 azPT3+HDztPbZBdxOQkRfAISQCQroto6LALGYyk1t+zTj1MStFrPDaTdGTAFnJrL9RRd
 ln4S48VtxwADhLNAym85muotDdIjpcaJK5zuYpjNq0rNxcgQVO+HyOccZOj0298ZY/qH
 ewTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymXbQn4yh640Md6ALwIiwWx/ogGOI+5wQMm4YP9kOu4=;
 b=be+N9w9WzbWohpTaOZELir0Il8h/95s7N7rbbh/xn8N59SOOkzRuNENrzYKbRNmCOf
 sUaevsUC5fp8WHArA9bSHXQyxYv6hgaMuwL7oyxO/0qY3ulLuy2AxswDKvpYO+eRbd0x
 BGuBOxwSkdLQYC8IWJ9YZOoJA9u7pVxCich798AwVEdKzRsL/olCleyMxkgzB24Z/NJs
 mpZOAJ8UzftwffSkyrRiF0Vt62aP4mOjxkS2FFe6sPAju3l21qDdolaPgDuO3T8Qb4bZ
 9IktOl19PymNrmMnVUjNxrB4bEztLEbWm3iKgW2MGYj4Xo+FPtSqvlcD0ew7/gdaF0GA
 dODQ==
X-Gm-Message-State: AJcUukdq3DCdc6ciaJpKZmbp6dkC52kOUVC3oiorCPWsXKnx082qwW6Z
 AgEdGrjILuB38hSuhHBJq3PyaOKaJan8g15pwTE=
X-Google-Smtp-Source: ALg8bN5WJlgaCIiYvli3IBWCIDt7q0Fi5ozCsUYwacVpePPnpbdn09bZRuOVuNV8/ayz411Ne11XKoIQx4y20ydUYCo=
X-Received: by 2002:a9d:7749:: with SMTP id t9mr4971581otl.342.1545498089169; 
 Sat, 22 Dec 2018 09:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20181220161037.23756-1-jbrunet@baylibre.com>
 <20181220161037.23756-3-jbrunet@baylibre.com>
In-Reply-To: <20181220161037.23756-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Dec 2018 18:01:18 +0100
Message-ID: <CAFBinCBQkpLxUZYp2NQoXEA=8t_XCJMHauM+DwTz-p0FA57CrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181222_090140_175788_4CC1BEBC 
X-CRM114-Status: GOOD (  15.17  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Thu, Dec 20, 2018 at 5:11 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> While some 3.3v eMMC 4.0 are available from libretech, the default
> option for the aml-s905x-cc seems to 1.8v 5.0 modules.
nit-pick:
can you please state which module (storage size) you used for testing?
you probably still remember that we had some confusion on Odroid-C2
which eMMC module works and which doesn't, so let's be explicit here

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index daad007fac1f..d0d202cf7161 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -118,8 +118,8 @@
>         vddio_boot: regulator-vddio_boot {
>                 compatible = "regulator-fixed";
>                 regulator-name = "VDDIO_BOOT";
> -               regulator-min-microvolt = <3300000>;
> -               regulator-max-microvolt = <3300000>;
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
is there a 3.3V -> 1.8V regulator on the eMMC module?
I'm not sure about the schematics but it seems to be that the board
itself supplies only 3.3V to the eMMC connector, so I'm not sure where
1.8V come from in this case
can you please add a comment to the .dts about this?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
