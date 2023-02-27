Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F1C64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 18:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUACg/cr2WhSJw9+XFo3TEcf0RRZgTxTWk6Wwtx9H38=; b=3QpsMpPworoPOa
	u0fRnjM7ltxnYm6WF8wswRBnfT9y52tRn85Td+JYw6Zi7JJUsBMgf2hb0RInp/fUN0Cr6pI6Jxodb
	HuWJVPLVoLgmXrDWGOr8uctv6/EjhuGoDZZoSdbiFdHisanMj0OUF58i7ye73bZ8/dK5dRN0Plioi
	83APMyKuzKLLSILGRnF54IkGP7ZDjMnS6ig2uvxjhGTAl6QJjzp0qclu9sYOZPolzNHbzmVWdkdia
	tpj4+f+UyjxTfQKZo+oMPr3z9htGYny1cKj0cXt34Klhr/qINrfwahn60exg9N7OiGVISl5vrzmw9
	ig9bt7p9mD+eAkL6D0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWi6a-00AgaW-7M; Mon, 27 Feb 2023 18:20:08 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWi6W-00AgXL-MF; Mon, 27 Feb 2023 18:20:06 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 476C65C0036;
	Mon, 27 Feb 2023 13:20:00 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Feb 2023 13:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677522000; x=1677608400; bh=RVTlLb8n50
	XGcQuBIt7qqzi2yYXGnyOm8P26ox+Wrpc=; b=GaD5doaretM6A1f/fO2rhersoK
	SXJ83sBxCfFA8RkVSbIYnTKJXGHnKWGyn9A3ri5dFoiHOBYcMoPGA03dNRsDBidA
	8phOORR91nRFKwsNvKRa6A56tMUTPFFsv37Ciyb3Xm26AZ3/E/gH+2kU43NxGmZg
	ixxLL8eLwO1S/sDosBhrPqGxzVcYqrIS13EdjOtW6LKT23zfFrYfYT5JuXJlq7BJ
	8ZTj6gfXP/PxUEMhLbnhVMMxPN+V6MOlRXo0GpoLb8fBJW+aHZt8sAz5xqLzxzzs
	/oT9w2pb05YIV0VBsIEusiWHCfwWvOegxLG1ta+YMNXaGjv/XWnRQvjH8aaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677522000; x=1677608400; bh=RVTlLb8n50XGcQuBIt7qqzi2yYXG
	nyOm8P26ox+Wrpc=; b=rfdkkmaJPoyqPw1pChMyE+KI/R2Q+KyLxSMO6D2qCqzi
	2/FsOmlysVLym22AAK5T6GGZ8qsF8HkWl+4zVL7Z0+yHsjvDGGN2TGSerhktz9jH
	IP0HyMlrh7bas8a9LgOP4uNyprcMSE5UMg78rxiWzgVWOE3jw5PvBfX/mKfRJhhx
	Y1X8mRfAxLOCwJDEWbvVTxdnDNOLhjQ7+NUMKEoouAiPa6SSUTD4UvEVxUFJrSO6
	39gZSjK/ud3GojuGY4ecaznmqDpG3yE1a+8M1fehe6K1uFYnKGd9yZprur+tD80Q
	ZiwCwT7jI8hnhygjVRaS91+prES4B6Bli0lk5USm8A==
X-ME-Sender: <xms:T_T8Y991Y2CYNjbOBfzfnEpnUmwoqWc9Ikpie93O9dfbahgNitSQ1Q>
    <xme:T_T8Yxumybl14yhIjSmGX11dSePAAPs42_BuH9kPH6V-rKxPwK4jg-zqObQRyYhY7
    vU_RriZA5-y1IEmw1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:T_T8Y7BTXMg7bXhLs4vPXXijkAoBSpNpMRiURxB-itlPWWks_XFFAw>
    <xmx:T_T8Yxcuo03NCUAntT-86Nl9Bw4faYTm6XWtd9oPv0pHfxvClLXQ8Q>
    <xmx:T_T8YyMOW1UbNP54OL071P_S35YAq-qHZi6CCw704CLBUIm3vvI43Q>
    <xmx:UPT8Yzlm-Az41o5oGDJNui__mBIaWjEF5-a9e8jmkbAluMfFXAUbBg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9C132B60086; Mon, 27 Feb 2023 13:19:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <7d29f3fd-b8c8-4687-b6a0-b8956dd39f0b@app.fastmail.com>
In-Reply-To: <20230227165049.4y7jx5nnnlibe6kg@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
 <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
 <33b58877-5167-c453-e686-1d10cdca66c0@linaro.org>
 <20230227165049.4y7jx5nnnlibe6kg@CAB-WSD-L081021>
Date: Mon, 27 Feb 2023 19:19:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Rokosov" <ddrokosov@sberdevices.ru>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Alexey Romanov" <avromanov@sberdevices.ru>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Kevin Hilman" <khilman@baylibre.com>, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com,
 "Linus Walleij" <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_102005_217723_A33F01AF 
X-CRM114-Status: GOOD (  15.33  )
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

On Mon, Feb 27, 2023, at 17:50, Dmitry Rokosov wrote:
> On Mon, Feb 27, 2023 at 05:38:49PM +0100, Neil Armstrong wrote:
>> On 27/02/2023 17:15, Arnd Bergmann wrote:
>> > On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
>> > 
>> > Most of these don't apply in userspace, so the incentive to
>> > run smaller 32-bit userland on systems with less than 1GB of
>> > RAM usually outweighs the benefits of 64-bit userspace.
>> 
>> Thanks for the details!
>
> Looks like Thomas has already prepared a basic patch series for buildroot,
> but maintainers declined it.
>
> https://lore.kernel.org/all/20220730194331.GA2515056@scaer/

I see. I know very little about buildroot, but it sounds like
there are other ways of doing the same thing here. In general,
this is pretty much an Arm specific problem. While you clearly
want compat mode for small userland on any architecture but don't
want 32-bit kernels, arm is the only one that has a different
kernel "ARCH=" value and needs a separate gcc toolchain.

If the problem is only the toolchain, an easy way out may
be to use clang instead of gcc as your compiler, as a single
clang binary can target both 32-bit userland and 64-bit kernel
on all supported architectures.

      Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
