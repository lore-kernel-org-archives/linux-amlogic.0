Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109EFC04AB4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:23:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D84C22084F
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PbepUH1K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WI2iBDiN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D84C22084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vX8syGXMR0Gc2nB76GG/dHcIC5XoTvYvjUJqT0H47fI=; b=PbepUH1KvuNQl1
	mcKrD6Elws+TAua7+aaxDja1AAS/G0ResduyQF2HEHH2DivsEKXUMp8EQQnN/ApnoeEOWNRUSzUaT
	FrUOjg9ON+IHzsLdN2rbq5BW9JrBaWks181XoZ7rIZZpG//yxXi40xQELC2dAM7VLyeC/7MjvF3cP
	RzxRWQ6Yg9CXAp0+eOw/+4pn83OnPwctRpJei9p1UR346l1kdx5F8smPeWqci/tXbKEJK6MFzv4fS
	szQcn07nLoAB7v+BrfwPa6vLtD5eN1k9FF7ifoBQOQYrPSGki/obo57rjVRaIP8Y4fo38NzjKU39K
	5XaOD0odQpmNbJ7n9A5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQhhX-0000bU-4M; Wed, 15 May 2019 00:23:19 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQhhU-0000bA-Cu
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 00:23:17 +0000
Received: by mail-pf1-x441.google.com with SMTP id n19so374135pfa.1
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5HIeuVO94mCpx5lSheXh4TT/joqVZJDMNco4TU6ruo0=;
 b=WI2iBDiNQBQYnNO8zIf1I5Cm93vNfBc8DLM274EeENzYQh6HyU5OIOcXUCu5v7VUHi
 Vvowjub2/clMpmjpbJBkcBCD0H8Palt9XiSiwR+yvLteqXdm5BEgPGYEsl73Al6E5Pbj
 bkN/7YVJLeOtj5ztBW2Io8PYznr01N7l7/NMo0Ss7CyI+/l9k1XxGYZb37udI7eI2anU
 snyKGL9azRAt8t++XZOmsCo/sKojkZgUV+fRf+F6IAR0usXs+jgcpVFHZpoZnIxz4XJ1
 ZYl5FSwEYXMjolOzksFmT/UwnthtY9PGLBwlPdHRUeq6fMGTqUkEvLNa10kWRAdsudvf
 wsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5HIeuVO94mCpx5lSheXh4TT/joqVZJDMNco4TU6ruo0=;
 b=BTKUTVTCQKPLeGjnD/GGnNo96lVZ5vvgPDUF4nGuRGU/A5PiKx7PuChX/mZy3xA21v
 DAcdNPqj2pnSsObJ9sL4+qB5GQerN0gbKWrjznIb69JKtS2/pF7dOHYnxnGo/aepX/nY
 F4HqAmbXILKof9X4ss3k6U/OILQiATZhnK0LTLmJRDjjahVNmJqUtqTLLg6DlpB2LG/5
 ALfRMKRJL1aJZymIO/1vUJDyWSFwxct0xYWYolf1zpPnSFx+cjuMIjfTmh12j6PfJ202
 6VJJ7FED/fxvjz1NSUyxpeG3i4UPRuG3NJ1VLrOf0kUEIPVsR4qmK0fWBQCirBXfd4M9
 HgXw==
X-Gm-Message-State: APjAAAVm9k/G+YTReHp+cFM4232KVosi5l6QmBMo3E+2+6VQGZuJh9yh
 T2MCMjp+F7b4pOQqV8d4LFHNmlfP4a0aNA==
X-Google-Smtp-Source: APXvYqySDg667KIADa9m0x4Cb9pE3/e91sP9wsror2TboloDaKWl0tgT6z8dIix7C8Y3j2/LfrDD2Q==
X-Received: by 2002:a63:1e5b:: with SMTP id p27mr39817338pgm.213.1557879795688; 
 Tue, 14 May 2019 17:23:15 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id q75sm333952pfa.175.2019.05.14.17.23.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 17:23:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: set uart_ao clocks
In-Reply-To: <20190514094537.8765-1-jbrunet@baylibre.com>
References: <20190514094537.8765-1-jbrunet@baylibre.com>
Date: Tue, 14 May 2019 17:23:13 -0700
Message-ID: <7hh89wd0r2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_172316_439741_46D122AE 
X-CRM114-Status: UNSURE (   5.47  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Now that the AO clock controller is available, make the uarts of the
> always-on domain claim the appropriate peripheral clock.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.3 with tags from Neil and Martin,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
