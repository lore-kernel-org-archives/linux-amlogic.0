Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C29BC47096
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C414961090
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C414961090
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gw38kmxU0spC+ZBz6rHQMPPPkus40mvK6oZYogxAChU=; b=x7N230fP5a60a8
	Kax81LpLhqIRAA5feI4dn3PjpL5uQn96nPQD2mnfTJGKOvSTD/Ma9FLBzSalSd108LPQVirY/JWa4
	h7sXcxn/tNBwCx5qeWiqXuF84WMluqeBPr7kxrybuoLV40cPRFq9Nqvv8Hyhe1rpyO519olCABxWE
	KxY/W1QY/M0wuiihi0Rt26VIoqj9uvVfHrQTJ+V+USS3AJbXCF3fye7wsFTR0neMO+k85eeAEEYEb
	wqhVHk3b9XQ0z/f6ehWLOqBldiwvi+kdMFdAZkIl31G2OmZHkA6anyx+JRaegYSMtE/06MQ2ZW7RK
	zgOu9fiKv08XPv9XMpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorl8-00A3Jh-8p; Thu, 03 Jun 2021 18:07:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorl5-00A3Id-BI; Thu, 03 Jun 2021 18:07:56 +0000
Received: by mail-ed1-x531.google.com with SMTP id o5so8193645edc.5;
 Thu, 03 Jun 2021 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYJURPxWBX0cR9mUpvvw71/w4E4zYIFQ+91/6hNUZl0=;
 b=jqr+MDrbXS4YAJ9lmXLHLruxtUvtxXjJqfzkg0sr3GVESKkRp614MZ+RdtvBX491w1
 qaIS+cqBFLKzdh/Fxx0eKeb7MnGps1YnL/a406/8CKBBMUuaQaA4qQcCMOiVEC6oPOV2
 7V/akX8QfHzSoTjdo1/I83L9iLt6Pfmtt+oLopR5dwzOnEu9d40Oof90DBXBAkxzuGTb
 h0GmBSHs79WLU29SvmSsPZUQgJxWzKYJtPPnW6HXl4aQTMHhNNUktaMaVPJLU9Yzwv+C
 gbUUIUbE72RjBjhXDbgON2crJzmjTTxW1uMpLYGucvrd6P9WPVZHVQX4aqIsIbQqNKnV
 P7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYJURPxWBX0cR9mUpvvw71/w4E4zYIFQ+91/6hNUZl0=;
 b=Bx86qNJ9VLfgNBZ7w4C9tva/5IX7KsomkD7GOR8+sRWDr5HGuxL4jRUezjnJsdo0/I
 tCkTLvm+ptryRvNENSfN2UhoQo1ObhvNAsAi9LE4EffMQ/qdLXCazPSaCe2N8BMzPD0D
 JiRNJhPDDNsbgeu1Ki8e8TmaUHCI8CjI+5aUUbN3FG2/r5wCOf7h9pOlxfESp94ZmznY
 JQiz9HjRduX0EZp2uE2//5VQ3MC0apMKbv/yzwCzvQxon6Jw1WQX0ORUxWusgkX9Klt8
 8IvD+ovGgh0P7Xy0jGLsLEW4IIm4rBNfIzwJVMWtsarPbNN8ZaRoyzr1jge1hw7yjCmG
 cqAg==
X-Gm-Message-State: AOAM531ADqkIaAtel50gzuQ4P2VXLyxAm9/cwkxeOLX9TaEUAZKrUVd7
 M7mdp0eX26SvVy9F6iy/l7HOnnI+QjQ9jqqwC5Al8RibW4g=
X-Google-Smtp-Source: ABdhPJy/BvQ0cnHa+Dxd3Zf1ycYh3D9JDrctNeFJ50qSmvb4IkIpefIcVam2VrRe8f/haAzfhOKl4cbVUc4JPNKhcpc=
X-Received: by 2002:aa7:da8e:: with SMTP id q14mr729410eds.13.1622743673906;
 Thu, 03 Jun 2021 11:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-4-narmstrong@baylibre.com>
In-Reply-To: <20210601090140.261768-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:07:43 +0200
Message-ID: <CAFBinCB+SyCmxrjJLcuy=mLsChPZ9i_1TsaWkL3kuhPO1wGwWw@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: meson-sm1-odroid-c4: fix hub_5v regulator
 gpio
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_110755_407716_FB71A94F 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Neil,

On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> As described in the Odroid-C4 schematics, the HUB_5V regulator is controlled
> by GPIOH_8 and in Open Drain since this GPIO doesn't support Push-Pull.
>
> Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
my interpretation of page 32 of the schematics [0] is that GPIOH_8 manages VCC5V
GPIOH_4 is connected as RST_N to the RESET# pad of the USB hub -> this
seems to match the original regulator definition


[0] https://wiki.odroid.com/_media/odroid-c4/odroid-c4_rev1.0.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
