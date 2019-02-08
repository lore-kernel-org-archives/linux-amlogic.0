Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF37C282C2
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 00:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDBB221907
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 00:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tsM8Mr2n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EELu/fbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDBB221907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZXommouCwABh+pehabiLXoFQnwOVp42gQBo51oLTeQ=; b=tsM8Mr2nLcRY6b
	cnlIrJ6qHtuTIcEp/diEbLQZT5QPMDMOQPadW6uQB2v7r3OHE5Pjj4mT/32reYEtE1R4/baYVYLyv
	VICgyWR8fQizM0/haGFU0hdhgq/cIhgjBEq7TgXIP6eqpQw8dcVAyWQYM/TR7w/Vop6FnyCTNCp8L
	GUpRGFH5Ext7fTBLrC/er/zmrm5Du+bjryrnObV8iH1ZEW61dPim85xPbjfRS/qlA0iQLQ32Akhsv
	E4/1vy/bkCDjwswFdREOKhfOWadJnkdqtKDD69vqJN7YDqNFV4CLuqJFxeZwMQThlQ6CNixGCXtTQ
	vMn6X7kIiDeJ0zLAkBBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gruMg-0007Pn-LC; Fri, 08 Feb 2019 00:49:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gruMW-0007Hi-65
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 00:49:49 +0000
Received: by mail-pl1-x642.google.com with SMTP id u18so838052plq.7
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 16:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=igWMC6rHby596QWZ2CVQNpZ2BdkN0gx1s+3p6FSiN/Y=;
 b=EELu/fblR9WxJjmRDSQOmP5+TvvSI/KEuuzURzyttry409Ld/t+K6SVQFxL6x7T51e
 deyFxzJLjnk5UPsDmdqTh4Cck9z1X+WYAr/2ciKHpIanp+9TNijgeFp+Z7GwnEtEMQqv
 UYbWrYy2h72neWsbErVwRZKjxLeXRtTo4zQ0zlCDOvCdKHMububezs0iEsWDDXfH9uqP
 KdZhAtwcjLXa+6Ajm5cnlrMYGFpvuFY99nMGKkYC9PlIOuV1VebnEfv+jqg3B2I4re2N
 C1pb1BeutJ0/49r6GDrXerBE1jAaDpahnUzjZ8HcFsL/McHfbCJ3krEkNubJ2zHqnZWp
 PnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=igWMC6rHby596QWZ2CVQNpZ2BdkN0gx1s+3p6FSiN/Y=;
 b=iKmjGUBuomOc2I7fn7dNYz+U8Fcfg2Mz198fCQPPIS4lpHyEq75yLXiiqs7KAg7vPL
 Hin+x43UFMRR6bXLo+tc3tMtuky6Ssc5fYYgSQosp5RQPoxDElWOlRn/bU2eB3Rkgf1u
 saQEJAqko5R++dTWjfBJXMymgt0JYCejNF4D3jSeTSdYLcMFBOwU8dHN4/pHfOOpf1u8
 AT7mor1EINeDmPu30TbGzqL3NJowdiokOLHikyg9DIX67H2wDoydN2P9qgxNcrWH8HKH
 S+dlIDJVLBO2haYyo9lw4o7Sq8F9IaFir/SMG6twVK9uzVdFgBK9Plpgfnb+AhtqnZq5
 msyg==
X-Gm-Message-State: AHQUAubz1Rnu37y9nbATEz9v8ceplwcTYhNl5wydFlNzNhPD3qE0kWqK
 75j6opb8wEmNdMu5pe+69GpWvQ==
X-Google-Smtp-Source: AHgI3IZuTXzpdYL1QTkcFFChP8DF7vS3FKUitDqgwBCMhR/ypCOd9QZQ/ryUz2TAXKqN1pJAOQhlhA==
X-Received: by 2002:a17:902:8f98:: with SMTP id
 z24mr19263866plo.40.1549586986699; 
 Thu, 07 Feb 2019 16:49:46 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id n72sm44884pfg.13.2019.02.07.16.49.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Feb 2019 16:49:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: g12a: fix clk_msr node
In-Reply-To: <20190207132603.694-2-jbrunet@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com>
 <20190207132603.694-2-jbrunet@baylibre.com>
Date: Thu, 07 Feb 2019 16:49:44 -0800
Message-ID: <7hwombf6jb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_164948_221837_1D9A506B 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The clk-msr node should be in cbus.
>
> Fixes: eeca2cf15e05 ("arm64: dts: meson: g12a: add clk measure support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

This one I squashed with the original (in branch v5.1/dt64)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
