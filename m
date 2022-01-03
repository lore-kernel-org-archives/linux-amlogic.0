Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AA6C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tSV/r7N+5x2FffPpi310RGORzoytzqxy6PMMK3j/81I=; b=CuC+tuTVxUsVJWC/IZSkav/x7W
	EyvSf6Egczhy1fXGGy/HPMcnygCblTVFtTRATbGCzhgGvfIUa7cftKW4zFtGCFRt9ZEDQj+vz0adb
	aaFf36r7xovTnqMxaTodQwIL5i9uz9XtLhc9cIHjqlkkHpX3j7BeArBIpMmeYQTigg5LNgOZTfZpQ
	VNC/oocdB8ZBkx5Th9pnUZCy7a7VPFhKYmNAWpuIs3qX8Li3jsdhOvBVpuvyLffX1M5rMlFeHHtxQ
	74ylMLtGHLFrxFMFYrdJ0KnBBCA8WEuUBGlEzMokJXoOSMB2E1nzlSq9NpvcSxBxvCflgWGk+iEX+
	0QXPkjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4LKK-008qWH-TY; Mon, 03 Jan 2022 11:16:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4LKH-008qVW-7D
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 11:16:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso20945997wmd.2
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 03:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t28TMUufcPVifrbma5vt3kzMSNjxpkRPdx4Vm4ZAvJY=;
 b=kCyJMKVuV44jLYAWVrdRkNS0uHdIPQLOn855UQt8nIy2sDf/SGtoIxJw/28XZzn9y+
 FJMuqiugk2LfWAvjCXz63NtutgMUUqWqP1oZ3J9cj635XRD4dceL4V4XYaVkQt3ItIQu
 dOWwoyM2oY7qK/A7IGidF4RhgSOHRPbmfiTTbBqZxa9Z5/1J6iqUlnqFSsb/zST4NuoN
 n42ypdYOp2ioTFPdrnpHoCRSCCwmJUq0tHNNbu0SYs+viVWqYjkNK+fBiS+kxXmCTQIP
 ok8R1ZsQBZmP9K63c5TgQHivOlM0ZH9dd3uujUgAsbobOtbR6S0cELJjHmOzR+g81/fo
 p6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t28TMUufcPVifrbma5vt3kzMSNjxpkRPdx4Vm4ZAvJY=;
 b=Ek4f9wiakj4WvSH20pwjQwcHnCFZioNdXj83pDkC87VentH/J7ww56+LKiHK3hRSDc
 zBuPflritH3PiEHI9p73h2PSPrAsWLmsZPxkKHAQOlqB/Ywuquem6D9lxBipElQEENDN
 Z01stEqxBU7GbkDrj8B8YsgX0hvra3n2WjA2PdHnK8LrmxxN/2DH8uUFltlBuF3xQpv8
 JnSW32oG9gnkQvbYky0Qac3gv72C1OuTXxDIDB27DW91QhBA5cg800mRIzEdQpd6iycp
 RdN7iW2tHNn2ELZJLUnvq2T2rQf7IYcsmOLM864n8tDeRghsVfdTpyFnhNDPdzeZA13d
 hQzg==
X-Gm-Message-State: AOAM533/04ghpHGLK5s3BBBDNbnAkYsXWA/WaU3Fx2wkFvbH1CuTypVh
 xl10ul2cfI58OTnShJoWwzixiQ==
X-Google-Smtp-Source: ABdhPJz2WwhZD5aHiO6DEz0k1dNtVSYr/xgKMa4zYwjSlVO1l0QAKWV3xeEhunQSO6SI0h7yMS4/+g==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr38043532wmb.73.1641208584245; 
 Mon, 03 Jan 2022 03:16:24 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id m10sm35357402wms.25.2022.01.03.03.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:16:23 -0800 (PST)
Subject: Re: [PATCH v2 1/1] dt-bindings: display: meson-vpu: Add missing
 amlogic,canvas property
To: Alexander Stein <alexander.stein@mailbox.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20211219094155.177206-1-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <af0a8ecd-3c41-2eb8-43bf-dd439a958d53@baylibre.com>
Date: Mon, 3 Jan 2022 12:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219094155.177206-1-alexander.stein@mailbox.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_031629_302235_F41F3BA2 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/12/2021 10:41, Alexander Stein wrote:
> This property was already mentioned in the old textual bindings
> amlogic,meson-vpu.txt, but got dropped during conversion.
> Adding it back similar to amlogic,gx-vdec.yaml.
> 
> Fixes: 6b9ebf1e0e67 ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Changes in v2:
> * Do not linebreak Fixes tag
> * Make amlogic,canvas mandatory as it was in textual binding already
> * Add amlogic,canvas to example
> 
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> index 851cb0781217..047fd69e0377 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> @@ -78,6 +78,10 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  amlogic,canvas:
> +    description: should point to a canvas provider node
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>    power-domains:
>      maxItems: 1
>      description: phandle to the associated power domain
> @@ -106,6 +110,7 @@ required:
>    - port@1
>    - "#address-cells"
>    - "#size-cells"
> +  - amlogic,canvas
>  
>  additionalProperties: false
>  
> @@ -118,6 +123,7 @@ examples:
>          interrupts = <3>;
>          #address-cells = <1>;
>          #size-cells = <0>;
> +        amlogic,canvas = <&canvas>;
>  
>          /* CVBS VDAC output port */
>          port@0 {
> 

Applying to drm-misc-fixes,

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
