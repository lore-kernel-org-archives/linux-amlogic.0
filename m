Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A689C072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 19:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EEA20673
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 19:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bENmn0Ok";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZaagklu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12EEA20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJ7BW6sNe399INg7W6LiaA/I9EtjWdeen+/UBW0tv8E=; b=bENmn0OkRbgIJ/
	pqfPCOlhQyARM2nijMLnX+BOFjDG4DPvzyJobG8h5PdXOrwAEk1gm26Txgqfu5M2uikaTS9061sNB
	T8Xfb90kyyJb8pMYUxCq8EMP0rWpZqPCZY4ZmHHkUmpKlnpWiWK1FFRkw0r/AoJmilCYmhrYmv48+
	64+XqZaoTnADJRkkbjBrpIKVH/FBQhuvrNwR0DXYSv6d2fzEQOKTJgdQ6Z56r/3ZiIclf0wQSB6D2
	cNkvTyx8t6UpGG26XeqofGu+n6dk+tMkxjqlvOU4y6WulvCm3YELnSsFIBnm8zdiAjwebK2ys/WgY
	0Ix5GJxgztovpP7D4iQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUG5B-0008Hf-VI; Fri, 24 May 2019 19:42:25 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUG52-0008Ae-9q
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 19:42:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id f97so4558852plb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2dfVnj0z8UOLBg4J0DLOYq1772RUeCwK2zOSGh4/SWE=;
 b=vZaagkluwNiMRjWKl9RSzMjTzb/+1YkoKYezoNgxeEzDWoAOHNJVRD9hB1opBDxErw
 9xr5lV+VyFR9BaG556Xbp/vjkxeWkT+Hp4S7UOU7UZYUdMd77t6LqmAH/7oIpxRYyGTw
 rq1osS6x3GG1knr0FPHct2FPZQRdXEBjgnwzbFgO/Fm6od5VxJolEgong3iGe/q33LPY
 PECMT6loq99WvXs7EO+G3X2PFC9BhkDxc1L/lWQXJcJ7vUN8vOxDDwzC2YRTmBDjKJpP
 U9YYNomVlkkz70eP704r5h0sK8Zkwn0b6KBYbXBLGrkine52vJuXr20svFAgfonrwn3I
 Zkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2dfVnj0z8UOLBg4J0DLOYq1772RUeCwK2zOSGh4/SWE=;
 b=Y64nE3dDkQFy8/GdZrUawxOrubCW4e2gRZwxRc/LAZYo8OQsLYAtoD9BOxEq6Yhh1t
 M3z+ClK42CoCv36RNT18im4m8O8425mrqPiNNu7FDz8qr/8d3DZCr4O1YaD7deJ/zWaU
 MdN1L++YMbT9L/vHz88yDIFLVbrbFN77p2YJzCCU24Ri9zG2dOQ3hKLao+7F5B48Cks4
 5oEkjqyi2IX0mFiiHI6MkcKpUSNt5nvEmClA89wiJr/Wh8EtXcIilKeiqETeNhEyweQu
 zwi8H0zyGAqY3tFuB9VEXg6WNyOSO/mxct58joYNomww+ObYEgzA9INuEbwGu8vq8vku
 CKpQ==
X-Gm-Message-State: APjAAAUN24ofhfQVC1eqKp5ieaMxNQzOdrzhWKJYtf7VWgkrTTK8fO1K
 tRhg3VPrrTAIh3BDBQuzymBWinQMX7swpg==
X-Google-Smtp-Source: APXvYqyVtWnRm6ZPuzBDAHjyTx+TyF/ONuADCQywreRoi5SrfW3rQzlo+xq+gy2RDJoIMj5p7saM+A==
X-Received: by 2002:a17:902:1347:: with SMTP id
 r7mr64611826ple.45.1558726935160; 
 Fri, 24 May 2019 12:42:15 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ed4f:2717:3604:bb3f])
 by smtp.googlemail.com with ESMTPSA id r71sm8643926pjb.2.2019.05.24.12.42.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 12:42:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/1] ARM: meson8b-mxq: better support for the TRONFY MXQ
In-Reply-To: <20190524181936.29470-1-martin.blumenstingl@googlemail.com>
References: <20190524181936.29470-1-martin.blumenstingl@googlemail.com>
Date: Fri, 24 May 2019 12:42:13 -0700
Message-ID: <7hblzr1vxm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_124216_351490_61ACD267 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 hexdump0815@googlemail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> A while ago a user asked on #linux-amlogic about the state of the
> TRONFY MXQ in mainline. I did some research (mainly downloading an
> Android firmware image for that device and looking at the .dtb) and
> updated the mainline .dts accordingly.
>
> I kept this patch in my tree but didn't hear back from anyone with one
> of these boards (who could actually test my patch). That was until
> today where I got the following message on IRC:
>   any plans to submit your latest own version of the meson8b mxq dtb
>   to mainline? it works really well for me and the one in mainline is
>   too simple to be usedful ...

Any chance of getting a Tested-by: from that IRC user on the patch?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
