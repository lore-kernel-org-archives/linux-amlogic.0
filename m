Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEA2C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcjAPT4pV/f84K4zs3i7fgSLz9hSAFRfjXcr82aDwvY=; b=iwwOQwSGlRWnuG
	6Q1Wx9uA4M7C2AixXzpbnbwIa8LjiIhXbhCG3qjUxaTisb78furz+ienH9u3WRI93M+J1qiBSPmsZ
	EpDFemnz3nwsETDeYFDxDkoExcFIir52+01qTMxAUIzhE6Md6ykuTWpZLGV5qaQCHE5fZczCVrgjs
	F8w72n0eYvRgAUtYNseRF27C9zWyzMnckQ03sEcyx0JKhe+mAwakfH00hrhNtiL6OET7w0jBu1i1F
	GsLXJWE2ZxIhTCiJFQlv9NN5kHAhEGu3yuMTmuezCwGpG5SVryzo5Yte/HVpkjlgyQcCsOFS47TE+
	eBXDP1A4Nn6yd3lVcSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjint-0022sM-2A;
	Tue, 04 Apr 2023 15:42:37 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjinq-0022rM-2U
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 15:42:36 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 65C4A20041F;
	Tue,  4 Apr 2023 17:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680622950;
	bh=HItSdPUax6WKV/Lpedrt10334waYiJbsMWf9mWy6eSY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=m44J8b57Oo06NoK3IMh15caYJJOAxxx4cQcKDiWpTL70GfjsMa5jrwvTXXhdGAqY+
	 eci25GJkpO+8AaJ7g2/SgO7N8sAq0V3RqwihJgJzlfBXRPkU/ORdD2Q0n1jgByBSQg
	 0RgNmJmvJrm+vFKRXkoes33J/MKjO0JXAd4BiQP6ECkY8bngOybvunPw4FB8E303yq
	 xqbdnYPyTStu8ZD16AxY+BXrCH87EDWdnBjZoVj6oi7gPNJjIVq7Lg+PoloZJUGVRM
	 5z5rY6cHBPve60ZPGVuzL+vQ6+tpEPhEt+EyLrAG/d/ebXb6NuRNmH8DKEUikmU0v3
	 j0jpYV3gS+w4w==
Message-ID: <620b5ce8-8c87-5b45-2389-3eb99e15b8cd@free.fr>
Date: Tue, 4 Apr 2023 17:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Throughput & CPU usage of WiFi download
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: linux-amlogic@lists.infradead.org, linux-wireless@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin
 <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>,
 Pierre-Hugues Husson <phh@phh.me>, Arnaud Vrac <avrac@freebox.fr>
References: <cbbd4a70-850d-cd1e-9809-1d115378fe09@free.fr>
 <f2344e2e-2b53-9f57-d15a-25e5b03b3029@free.fr>
In-Reply-To: <f2344e2e-2b53-9f57-d15a-25e5b03b3029@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_084234_953310_E492E674 
X-CRM114-Status: UNSURE (   6.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/04/2023 14:54, Marc Gonzalez wrote:

> 2) SDIO is clocked higher on vendor system, but could
> lead to instabilities on some boards?

Apparently, I remembered wrong.

For mainline, arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts

	bus-width = <4>;
	cap-sd-highspeed;
	sd-uhs-sdr50;
	max-frequency = <100000000>;

For vendor, common/arch/arm64/boot/dts/amlogic/mesong12a_sei.dtsi

		bus-width = <4>;
		cap-sd-highspeed;
		cap-mmc-highspeed;
		max-frequency = <100000000>;

The vendor DTS has the following child node:

		sdio {
			pinname = "sdio";
			ocr_avail = <0x200080>; /**VDD voltage 3.3 ~ 3.4 */
			/* max_req_size = <0x20000>; */ /**128KB*/
			max_req_size = <0x400>;
			card_type = <3>;
			/* 3:sdio device(ie:sdio-wifi),
			 * 4:SD combo (IO+mem) card
			 */
			dmode = "pio";
		};


Thus, it seems that the performance delta comes from driver architecture
and different HW setup, rather than clock difference.

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
