Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76BAC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+h1/Hu9UEPiwV4OvFNgkjqhRZk+VI7Q2oVePWY7Jaw=; b=IW9nE06WEXx/m+
	gGl0cjhPkQ45VurlUbHLP5qvoQJ/oamx/Jk2hH1fOAXAYNNJedVOzVih7SvJsx7JWcPuxI6Z9zx5j
	qnWhQ7yGrhgUbfzbAVA5453KVeuCZV1d5RO5Xo4R4z8SIf0yxJBUKYmBbHWZeEs+Ll5YO1N4zU0jl
	Qo1VmhcEkKoo42Fkz0u6vyMXVLBjRTBBR8/FSbKQbrIUPKCOtp7tTIX9PiyFq6r8E+XF0TvB7inQT
	XYFrPXjcAYKQ9+dnzrZLYa8WDk9pgywjz/WJFDN/+TU+tyD8TAOICgtJxrA0Cfz8plmSXqVMSxjas
	weI0Ia8c8xJcPjj4tlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qei-00ABen-5P; Mon, 10 Jan 2022 09:07:56 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qRt-00A4wx-O1; Mon, 10 Jan 2022 08:54:43 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 10 Jan
 2022 16:54:39 +0800
Message-ID: <f16843d4-c3c7-9b24-e262-3ca5472e07a7@amlogic.com>
Date: Mon, 10 Jan 2022 16:54:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] dt-bindings: serial: meson: Drop compatible =
 amlogic,meson-gx-uart.
Content-Language: en-US
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220110082616.13474-1-yu.tu@amlogic.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <20220110082616.13474-1-yu.tu@amlogic.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005441_835248_C2F62C75 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi All,
	I'm really sorry for sending the wrong specified file. Please ignore 
the email. I will resend V4.

On 2022/1/10 16:26, Yu Tu wrote:
> Deprecated, don't use anymore because compatible =
> amlogic,meson-gx-uart. Don't differentiate between GXBB, GXL
> and G12A which have different revisions of the UART IP.
> So it's split into GXBB, GXL and G12A.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   .../devicetree/bindings/serial/amlogic,meson-uart.yaml | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 72e8868db3e0..ad9f1f4537a0 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -28,7 +28,10 @@ properties:
>                 - amlogic,meson6-uart
>                 - amlogic,meson8-uart
>                 - amlogic,meson8b-uart
> -              - amlogic,meson-gx-uart
> +              - amlogic,meson-gx-uart # deprecated, use revision specific property below
> +              - amlogic,meson-gxbb-uart
> +              - amlogic,meson-gxl-uart
> +              - amlogic,meson-g12a-uart
>                 - amlogic,meson-s4-uart
>             - const: amlogic,meson-ao-uart
>         - description: Everything-Else power domain UART controller
> @@ -36,7 +39,10 @@ properties:
>             - amlogic,meson6-uart
>             - amlogic,meson8-uart
>             - amlogic,meson8b-uart
> -          - amlogic,meson-gx-uart
> +          - amlogic,meson-gx-uart # deprecated, use revision specific property below
> +          - amlogic,meson-gxbb-uart
> +          - amlogic,meson-gxl-uart
> +          - amlogic,meson-g12a-uart
>             - amlogic,meson-s4-uart
>   
>     reg:
> 
> base-commit: 99a507a8ea28542ec196e2dd80096708e2482735

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
