Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71760C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 07:02:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0098664DD9
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 07:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0098664DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0YyfQfHqN3Czkhsgu+SUW50Lsw6iVyeZsNaerL/WqKw=; b=RFAWoH4AHjlDWu/Kjoji9Nha2
	gGH0EkhnZYdzmi2DNkY+KsTjsi4YDNMZv2BVW3wmhZ212qA2DJv/WAVxCG/vxX+sTsNeioG0hJvHd
	RkXB7Em/lOk/kbDmrUdUdBWitgi3g2uLPgUqD0y24bQWt1FqFNH3xCsFz9zClZeV038j2A2khRHR/
	l3RjzW1wAMsicYdMyOMokUV2r/Lc5bLkJcRyXdGWO0v3m2aAhe6+4tkYpwnQlDmYWL+CYVxsPOCDr
	7WmEU11VpM+22j3sl2GhZIOZDMK0GjvVdY8R8qCdKZzolnyKwmvAAXMfs9CRwgWJspcZig6oX/yJL
	mDDckQwVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Nni-0007bN-Ax; Fri, 29 Jan 2021 07:02:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Nnd-0007aN-JV; Fri, 29 Jan 2021 07:02:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id y187so6323447wmd.3;
 Thu, 28 Jan 2021 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eJkj1V1MkLzif7cX7fwiDSMfGoJ2Oh2DLNZ/fCE/Z3o=;
 b=lPQHzs2oYkC3CFAEdZuyjl14P5w+IWZ1HGPJCGdN1ZqGxq//dyTY7g3BhrkShLae/c
 cJFflHbNBGsfWzzFZPVg1KGDNSxIggg3gJFyBVRhJy/6u3ROj1/FDOJV5g9jEEFY3M9u
 t0RQSCKmsOX25UvuWyHZCEKx8xb+rfhbkp4NGg3TCPdqlcily4QjD9Jrpa5rB12lELY2
 Cpv9sOJG6UjQjmzBoFSu+1lfXuW/2B5t4xXcFS28RPGQw0+yOXJnk/r/MM+hLwVABkXM
 +xGsFbPFQYC1Zi+4iB7quLZDL9NCZXflJmPgSg975sSGWFseVWvtklVJyLKjDaweMO7d
 d2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eJkj1V1MkLzif7cX7fwiDSMfGoJ2Oh2DLNZ/fCE/Z3o=;
 b=nta5H8pAVVaxpSKeWmFAE66VGITtef7VmAabdLAcX4GtC+Kb2g0c3KtxFCqxrYRcxA
 kPq+rFk6CJtfWDpGuzcvUbnoLc5074ntTSEEZzmQjqOQMEtWD4dn2qHBE7W9yZHPuGIL
 HplpCwlOe0T6tX/GxH2ZHSCITFMPRt5mWE2t8f0mQ4aHYjyxUidU0xZmxDRcDN2Lvqqx
 02GdDRv8tkAsacPHF+9gxDGEiWIpnOrzMJF4IMwTF24joS3z80kPh9t+DHhMMJTp6WSx
 TOuPTZknBM6MK6bAw6E9pFhs/+002S8irnWNWoevOu1pj967ohLA8gvu7WNOMpoJPYgQ
 l15w==
X-Gm-Message-State: AOAM530L7sZeFgA+3HN6/D79d+Scl2zuh9Er0weDaH3P1+L3NAuVwP5z
 QAYujxV8ux92u1trqD79Tro=
X-Google-Smtp-Source: ABdhPJxWE4Ozi699IpCCBMsLQSWXjJHZiDIf9lvepp7VIDJb3CSXA6F/5VIsb7x7Y3TnGi+jjySCmQ==
X-Received: by 2002:a05:600c:3591:: with SMTP id
 p17mr2408906wmq.153.1611903752141; 
 Thu, 28 Jan 2021 23:02:32 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b13sm10151655wrt.31.2021.01.28.23.02.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 23:02:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH 5/5] arm64: dts: meson: add initial device-tree for
 ODROID-HC4
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20210129065137.5473-6-christianshewitt@gmail.com>
Date: Fri, 29 Jan 2021 11:02:28 +0400
Message-Id: <1508520A-3693-46C9-A48A-2C3502DB8390@gmail.com>
References: <20210129065137.5473-1-christianshewitt@gmail.com>
 <20210129065137.5473-6-christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailer: Apple Mail (2.3445.104.17)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_020233_660703_503DB46E 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


> On 29 Jan 2021, at 10:51 am, Christian Hewitt <christianshewitt@gmail.com> wrote:
> 
> ODROID-HC4 is a derivative of the C4 with minor differences:
> 
> - 128MB SPI-NOR flash

^ should be 16MB, I forgot to amend. I can send a v2 series if needed.

HC4:~ # dmesg | grep spi
[    0.453235] spi-nor spi0.0: xt25f128b (16384 Kbytes)

Christian


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
