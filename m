Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A01606A33F
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2qjeeb9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jy6v125z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X0bALGOHTuVrZET1rFFtX2Jcc9LiPOUOn7x4UeuB7ZE=; b=Y2qjeeb9wPw26AFpbMKHzn0nr3
	IiQItJoQ0ALzKTpDYERzJSLx3oC5glVbAYj2iV3ddESmMkKqIH12UYJ3FhgaVhhM8ONOXaxai+Fe4
	KUBt7dxPMWDkRS9baga7CZQFwygg51EOG1gwqoNioLYpoct2M6/NTBcpfqdYrWed6HhapUOcDqWcj
	ZPxD4NIqsN6NQdKR0M0QonuZERO0Q3C0h9YE8O/OIXuAWKFWwM5q/HT9X3/pi3lP64UYKSeZvsa29
	rIt+OPok8xxbYXF3obJWWf3h0pMZtPIRSUDvgVPJJYlE1CinzXI++G8V13hXfSgJdMNdzS5pZmNzC
	nnLdqciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAp2-00000009Xjw-07n9;
	Wed, 25 Nov 2026 11:05:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAoy-00000009Xia-0lH8
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 11:05:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48dee593f18so5252120f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795604750; x=1796209550; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=jy6v125zJV1GWvX/j96lsHPqHM2rFVCJ3YqXv6q8+Aod6gdwEkoYWPZGBKoytRGpLy
         bpEQ5hnGZ71fHb+KmQ+qFBf9jVQzpKNMkq35yD38zsEjIfTmV2rfPaRgNxKjI0Js8a/f
         JjvGscRSTngTLd052ITeh3GN5NJ6rhEu5h4sPBJOWTxEwcWTi/cF4N1//BC3raYyEWjj
         ySyTn5rQAG0P6AV++nufRMAzB8kn3EqNobTN86/yk+5N5eSLAZ1z1UiikUwrN2DIuHpt
         CgCYHHPUzasTKy3R7fWR7LLYAOufccw7zqOlagXnh3IIzxcuwHTZFmoYkC/hDieWkbmJ
         a7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604750; x=1796209550;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny0ODnWnV6171dn8DCwt5qzCHPJg4PZkZSQUcRv3Azw=;
        b=hvWjboKnpoqw8vla+1XG7VdUXCJOCNMDwn6kiW+RsUrK2MLCkOXzXShSUy3rcpA0j2
         5QrrUBQI3BvVGJ93knBGDtfm3w4KEtOkuLziDDhg5Z7rfHeS/MGqZHYovgK+kh/NRUiI
         H6pH7g+/3+8S4V1kM+f/T9Dl5tq8nKA4u8cCAVrafhwjdjGvKTuHClVu2UeUHVLwJxB4
         3rchklaQCu+Es2xoonRZ44WdU0NhD5j6hCfnSFqDHrbPkYpzvfsYMkugyTFur1GMzrqP
         +wY9+ZoRQ+WyOm61ooNubZ62G3FjQ1p8H+pUr8mf3axDfpMQwYNki6eqv9J9Nm+8mzlh
         SxAw==
X-Forwarded-Encrypted: i=1; AL+hErFlMA7lN9Uw+xqhfXu79MefP/WLoXy85FEjy6ycPviEYBwI8trAq6u0tjOzdRkNk2/ZPMP06G53Q105ah3S@lists.infradead.org
X-Gm-Message-State: APuU4Z/T4yKw0Mwkjkub5BRTBp3kkzCWiUp15t3LCl6bqTw7UMVihQyl
	7c7k/miq0vQeWwcbvz98K5kvDsewLiOmxtu7BLARnW1TEmAVcvOENXvkLKHvIaTW29w=
X-Gm-Gg: AZFdTZf0eNyqafe1CEX/NM26z2QP5pKJVb/RHUOwU7uqWNwB3c+K7P7dIE46Goa25pL
	qrwXoFy8RWJMCeMNio6AXNqZTp6+CiSPnlpbTfXEolqZnRL8ZxT+4uwbqXJXdIsYYPwRwn53HWe
	qlRtJk7+CqoxkbGHYYXjFOdRNDUmJtqf+XVxsqJE5YTtrxg9PP5TB7AUTkNhZxhUoSokcXH3y0R
	0eXq6DRAmVybYTh79QJi1kNhMgir46/1YCZfw/hT2tMl1SXKfVqtIh/oS/zjAVAwsqTDLHxeBMn
	BbpqdSVHXwDxLq92wkQIpjU/G28t14awCXwTg1gqZM5AGcsHwGgc6VHkTBRb74VBKnx+NFVNul9
	m9Q6RdxB/c5B+vV/zReRCZlexu+yC/XN5Q9II3zkbICuvDrLKwtDvPw+DKHMo06rq71+Nl4kAYd
	EE3wGMsDHRA6qCmLIbERFDFWPfE+SnotoHSQOyVO6Ru0F6xA7D3XcKtZiJGU3tlIYH8ki8URce+
	ZDB5en66BvyyNQGAmKs1XuHRx4KR5CcJKqPfBFes+cofrxjuxG1QCSxPXlbUbZ7ClS+gZyIsdCo
	zuhi8g4gc38pw+aTPiwJKp92MQ==
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr24522718f8f.15.1795604749846;
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
Received: from [127.0.1.1] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm33775330f8f.50.2026.11.25.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b-odroid-n2-plus: enable
 SD UHS modes
From: Valerio Setti <vsetti@baylibre.com>
To: Igor Velkov <iav@iav.lv>
In-Reply-To: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
References: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
Date: Wed, 25 Nov 2026 12:05:43 +0100
Message-Id: <179560474311.1313389.4488537313012289406.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=oyMGF25BX72C/uylXywl0ei07ucGN60OTc56dWF+k0M=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDNlsB7kc8j+cLuUtWbOaY5GFsNB1qWc+f+zsz+ul5Vdq8
 bZOSP7ZUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgInsl2RkuCC+9l3Ms6QtP1QS
 1nHvmyl56cTF9jlrDk78WFz/eeEXnqmMDJ32r76cinf+P/uZUv7zVRJx74WKqz7xPOCOMlt1/Vv
 pf14A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_030552_228728_6C6BF9F3 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>, Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> index ce1198ad34e4..1f49686f359d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -15,6 +15,14 @@ / {
>  	model = "Hardkernel ODROID-N2Plus";
>  };
>  
> +&sd_emmc_b {
> +	max-frequency = <200000000>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +};
> +
>  &vddcpu_a {
>  	regulator-min-microvolt = <680000>;
>  	regulator-max-microvolt = <1040000>;

After checking the schematics and the devicetree I think this is correct.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
