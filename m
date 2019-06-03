Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850D6C04AB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 22:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CE026844
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 22:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uNMWy6u+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0svwj2jn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CE026844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sIoQvPvyvtD2HdJqGHpCqH/lGpMzORjT3QQx7KKkc0=; b=uNMWy6u+IZB7wG
	BhKq94wgQdBW8fRHn9WGxOt9CA0/IHTRRGT0xedkhZZ9x42kCGFRVUqze7ncp4G/6qWBzdcGFoSmK
	Yp8Lo22wqa0IHT+6rwtBbjm1h9oPhy7hthuEB2FBt47nixOiH1CEX5DVZvrA+6Vb3lDgZuiBVrR7a
	9hmfoThWfKfTOZwahzqXJ5mnAejZee39JSlQIsSFRe6ElLHco1JgMzYlQrX5QA5bY2hHyqB7VIQEU
	Qq5Q1puYoIJzk8+45iWVLGANejtoAT0SQPygzJ1FBgZgD2Se6RnGvdX239J22cE5sohn79HcMDVWF
	A7aeCbBc5Sxs0dIcEBlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXvOv-0003fD-It; Mon, 03 Jun 2019 22:25:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXvOs-0003eU-Np
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 22:25:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id go2so7495441plb.9
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ik7OKZ9J9bSDp1bm2rOmAtlE84TTDqAVmgooCQeS/Bo=;
 b=0svwj2jn0c7y5OH0otcrckgib+WkKv1EW7+xx5dc+sjwjycdCK/Ta6//1sv9QKNgPQ
 1jmhCgdEn8SYPziXQu8iVYn4lpEc6W6S2YaSFh7HZCNDQemXUEzOey1bTaF7PfPuQzQd
 Gd7VH63DZaay8qz6uQ7Z1lOf620YHpSFKqKwxLutkycHpJsPOvx4vLwjkc9Xuhbtj+HS
 SLRE1LFOeiLTa9+FQ37klOu5lGS5IjAPLXJB6s4dkgodzaszfer/mLqBQUb5AKeEOqv6
 a4pwrybHcgXnoJpS4AjWgBJB31yyvywL9aGzi5QJOjMqwoS2l0eQTUTWNRRCz6O8anwQ
 Fg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ik7OKZ9J9bSDp1bm2rOmAtlE84TTDqAVmgooCQeS/Bo=;
 b=W0tAt/GwzyJoHrocs9yFhfi/tE/5cVjKAy0kWwQkT1M5OIWfzWAe8DkNjmPHNBkUrs
 TVZ3U5GRg6TgVWY+BrGA18diaIZiplWyqy55TBroWdj9c7aeTlrh6dT3TMBuFxJzBHXr
 N2LbIwt9zpUlDB7SzwlKrENT27WudisW/prEen4P1Hmgdn7nuUsc6D/LsIZNgFgU1vrE
 JMvXlNyQLRjUkiJXZs+NnSFMVSCVjpLMqLfvrxPwFtXEgPzYiWJAW1Qiohmvk2CQntEm
 MenHpzamM60ZYyjbdpa/9nBXJFG7d7Nr/4Qd5IuXE5G8TM34D1dqGLbcijs94X00swyR
 lISA==
X-Gm-Message-State: APjAAAXRmScsTU8EMfP1XtP8b8OSJmw1GPW3aizxNRNeJHBQgEL18W8d
 tOMdCH+Q6ScX/4dvN1z83WyrnlQAZ6w=
X-Google-Smtp-Source: APXvYqyUVbCq5wYHPsCSWvk56C4V0YcIIPwDrGeX2enduJL0SwUMS6U+vOK+IkxCDgH9iPCmNKU07g==
X-Received: by 2002:a17:902:2a68:: with SMTP id
 i95mr33399553plb.167.1559600753876; 
 Mon, 03 Jun 2019 15:25:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id r64sm21793471pfr.58.2019.06.03.15.25.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 15:25:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 00/10] arm64: meson-gx: misc fixes
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
Date: Mon, 03 Jun 2019 15:25:52 -0700
Message-ID: <7himtmi9vz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_152554_777313_5A1A22F4 
X-CRM114-Status: UNSURE (   5.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset :
> - Fixes GPIO key DT on Khadas VIM2 board
> - Fixes regulator naming on Vega S95 board
> - Enable SARADC on Wetek and Vega S95 boards
> - Enable/Fix Bluetooth on VIM2, Wetek and Vega S95 boards
> - Enable CEC & HDMI on Vega S95 board
> - Adds ethernet PHY interrupt on Vega S95 board

Series queued for v5.3 with tags from Martin,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
