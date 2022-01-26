Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F006C2BA4C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 05:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYMglFkF6dClYfjEpdxBUYHSiZdfdzXp0ITzFUuI7sc=; b=eKAPUacAj2wwTd5oaDeuHcr3B4
	yR0l6WghJkMpzeN3u6m3Pjwif9M6lHTu2C8izcdWZliPuMTsjBHIwCFZYv1IrMhNAwjGt8IidYlDA
	LLAE0RIXvj81YKKvB4HYeylD7EHwK/EyXzXOVRWJy9QJMKUREJThOBEDjNEG+hI74HcqUf2tez8U6
	pBhhsjFol+eSpwkCJRWA7Fe1Wx5Ya1v19Ojm4v46ao2Jalj+Zf54EencCGxKLwuHbyHlO2o/9V/cg
	tbuS9XBGhgU6g+9HGWkw6at6qmifJV5Ab1RBLG4XRu7ollvCR5xufTZKulMOeIhg5Z4veOLJYkwuD
	vK58E6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCaxe-00ADK8-OS; Wed, 26 Jan 2022 05:35:14 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCaxb-00ADJF-2T; Wed, 26 Jan 2022 05:35:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11BDE282CAF; Wed, 26 Jan 2022 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1643175304; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:
 disposition-notification-to; bh=NAfBCWgItakVlmgvOLevvnbl8A251km2XBgrPyvmaoo=; 
 b=IzKgGGegy8oHHSLfLehfYpxDbseHD1HFTsIxaHd3pkLMi2ouayV+kV6Te8WmLxWw5FbukC
 JlMQluF9rg+x2GtkXCbane3cP71dr2NjNP/ISfGHRKfr8G82BFl2H7/t1qy5zyR1l5GBSN
 AVEsy7PC83B0OEhKbTTxeRtdsxTsrn1zDLh+25EIak975kYT/uMw9u8C+YXuh9lsQs7lJ+
 vw3Z9BaBuD7NySEkmAQxSC8bxDxkkm7WDS27EixglgpHG1S1EpgccmCMhFJe/b1R9LSjbj
 hjbMGF9NwFADcjk30Kyz0wub6Q7boKYmFU5ep1ffeyrYo01HESw4toyzETFBjw==
Subject: Re: [PATCH 1/3] arm64: dts: meson-gx: add ATF BL32 reserved-memory
 region
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220126044954.19069-1-christianshewitt@gmail.com>
 <20220126044954.19069-2-christianshewitt@gmail.com>
From: Vyacheslav <adeep@lexina.in>
Message-ID: <a279c365-0615-1c7f-5596-dec9ad1c8229@lexina.in>
Date: Wed, 26 Jan 2022 08:35:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220126044954.19069-2-christianshewitt@gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_213511_337897_56975398 
X-CRM114-Status: GOOD (  17.83  )
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

Hi!

26.01.2022 07:49, Christian Hewitt wrote:
> Add an additional reserved memory region for the BL32 trusted firmware
> present in many devices that boot from Amlogic vendor u-boot.
> 
> Suggested-by: Mateusz Krzak <kszaquitto@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 6b457b2c30a4..aa14ea017a61 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -49,6 +49,12 @@
>   			no-map;
>   		};
>   
> +		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
> +		secmon_reserved_bl32: secmon@5300000 {
> +			reg = <0x0 0x05300000 0x0 0x2000000>;
> +			no-map;
> +		};
> +
How do I check if we need a similar patch for axg boards?


>   		linux,cma {
>   			compatible = "shared-dma-pool";
>   			reusable;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
