Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97322C678D4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpAe7ZO3C++moHEKFlSSyj7+BI7GJf/qCSSlH34A0fE=; b=tnyvtGU8vfd2U5
	pYkevMRy2WiDpsDEVMgLsmvqXz1rGNABlrR+0WfUzBJs0PX5k1UXJjffeaH/mWcHRMSfvJMvgWgjA
	o60LGd03vj1tHuUsxZtstGUW7FWKxIiGq8wlmvPRfRfjJHYFMf1sFiN1E0Wm0S7hjZYJUpB3eJCbj
	XhtPxcK2qeMMkdTh/3JwqlKBNjhftrubvn5GJPwzfBLRb3/vQoNJkKvQWRNxzhEnTusxqyVQ+pWcJ
	uOgLc7NDEbEw4NAmDcArfmnHm7+oeRf3+KSG975f++Kq9dQ636gcqDlmwGhXl/HSpcKWvQF8bXO8R
	U7DioeQwOw2Ja0AWt3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5Ic-006Qaq-Ki; Fri, 03 Mar 2023 13:18:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5IY-006QZ9-Mh
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 13:18:12 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 412EA5FD18;
	Fri,  3 Mar 2023 16:18:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677849482;
	bh=PohEVBJpaCq/s8VczFxlHVqki7Sv8xD8pAL7OoD88sM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=D+6XsxQ9Z6nsis6X2br/imhZAMU1v3op2ZvV7GReVh4zxrcoMlA5gi+mcUUdte6gH
	 3PbD3ob/UnA027YBo78CLg+x0Q1HxX8glsLO6wktTxTdi9TnloOHdva/3ZGhR6T34w
	 6Xhc+djVvgNFQHN0fwl+y2eLVtBErry9mhYksDX2t4VCfnbBdMCVT8Mq6R6b56uCOK
	 a1B41IQc34hgTO+yucYY47Ss3vorksiQNrJxC/TPXXVut7u6Z8IbNG2/QCAL73KsPZ
	 1/93XssUs5UYJeAjHyvysL+cuFetM9wjMwlQU0TUbDwPfBwAnSRbGcHVQ6kv1LLNrI
	 GNlOSE7ZT54Yw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  3 Mar 2023 16:18:01 +0300 (MSK)
Date: Fri, 3 Mar 2023 16:18:00 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: zelong dong <zelong.dong@amlogic.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Message-ID: <20230303131800.aegeaz7syyuwosw3@CAB-WSD-L081021>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-4-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302063402.42708-4-zelong.dong@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/03 09:42:00 #20911747
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_051810_943749_6D159946 
X-CRM114-Status: GOOD (  14.45  )
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

On Thu, Mar 02, 2023 at 02:34:02PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the IR controller device of Meson-S4 SoC family, and enable
> hardware IR decoder.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts   |  6 ++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi        | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..4d3a81b3b762 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -28,3 +28,9 @@ memory@0 {
>  &uart_B {
>  	status = "okay";
>  };
> +
> +&ir {
> +	status = "disabled";
> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};

I think dts and dtsi changes should be splitted to two different
patchsets.

Why do we need dts changes if ir node is disabled by default and you
don't enable it here?

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
