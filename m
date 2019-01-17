Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9B1C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D6B20851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfulpfSf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vMkLQMSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D6B20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9dbf2lER6FTtHv82w+WhYj3D/ra3Gk7suNsIFP1AVc=; b=pfulpfSfV5DuLV
	f8uw4Ems+1yNLK+8wnLTlVeNUzyd+3UyqVBQe+smA154kqQh7QbTyO07xavxK3PGd+sdnvL7eNLk3
	wn+NcW2GVeCzQltE5qFdQuSkFw8lOHY3HqgmSCnfinXd+f83Pfe5TU2wAc5BYNG+MFMa9N+0H6RLL
	TLsi5Gfwp5L+xFa5kPFiUVHGdlcUkJotuQBiKVdT/+e4CUGLBegrmV0prc1BaVmzTowctwB0awghe
	RBxuBpzG2FzSg+g0lAD8DGD+1fW891GMrEGM7MGsrIptp6i813YgP/UOfTjMVo+Mo3KmV2ww1e9lk
	urfOY4FCDhTXdYBKnlFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDtQ-0005m2-LF; Thu, 17 Jan 2019 20:04:00 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDtN-0005lT-Km
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:03:58 +0000
Received: by mail-pg1-x541.google.com with SMTP id t13so4896569pgr.11
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CFnl8dyjGiuRB3x9RlqOHQmlDV1KXXaciQgsX6gUhkU=;
 b=vMkLQMSlzFUUMoB2rdPseJ2wFWNIx7yMkFLoMjvbGe9ZQ11W8ATa4sW8NCKNDLrMfE
 Pe0BxgOLxifJxiv6/eDPQ22CS/6tl5R6EQ9ED+L62/RKYqm1uEotxe2Tf3JOaEhHUFfS
 qxjU1xBh99gcsbGHz8GiyNqz2O5lBKdZpCJuDCF8sUrsKP5hR4uDxXcMWRM5mFL34nBS
 OWJ0BUwDf1sLG/mZwfRRSHUh0y3v4i5nxXPJX+5tgL6JSoIuVcQzvZvTPIwvbfvTXePB
 qUE7ywFzJmnaJ3lkDteqJo5Yh14lioTeKY1uw4wXyh6wSCmYZWxn3dRyNA5sVDih4eGQ
 ytGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CFnl8dyjGiuRB3x9RlqOHQmlDV1KXXaciQgsX6gUhkU=;
 b=t3J6Fsk+T12tiAYW0viJ8NmPSqpP3YYhsLX+Mw7vJBeOa9SWeZa31bO76jXyi4Sv8H
 D2EABo6uXl452koTmlpjQQ+HL8K3+D0J2waiu8unms8zqc0oOrhKtiM7hzDwFO0s8wIt
 1/O5jIvmVbtgtxoQS7/JUPqe90ai/PfX8Ul2ynsiTmNW9ekTxQikDixtwtLRltsOE0l3
 5CcYvrDVXQRfFDEszEpifqmvpzelsH3fEY7PxBK6yq7KJGVBb3J+4RzkPqfCsDqmgzA+
 8qiGRKoiyx2hp1gtyRLZtZ+gm5WkF7Ao6B1rte/eVrQZFtNfJgCNeCNNRkDgUPPsB7fK
 Uf1A==
X-Gm-Message-State: AJcUukfNxEvKvCo720cBx5numdgh9bCIZmmjsYDvKoMt87UPwgcH5WCR
 Qfzag3aV7QiSfmN3lDTkGIrO5/Lg0Bg=
X-Google-Smtp-Source: ALg8bN5jZaJngh1RR5VggI5q8YZhlkSYnkHJ60CjmRQnCCjaKEsSpZU0QBvT1vqA2BcKmnmat393ug==
X-Received: by 2002:a63:334a:: with SMTP id z71mr14802353pgz.400.1547755436912; 
 Thu, 17 Jan 2019 12:03:56 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id v191sm4040650pgb.77.2019.01.17.12.03.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:03:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-axg: add efuse device
In-Reply-To: <20190117100234.30989-1-jbrunet@baylibre.com>
References: <20190117100234.30989-1-jbrunet@baylibre.com>
Date: Thu, 17 Jan 2019 12:03:55 -0800
Message-ID: <7ho98faw5w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_120357_677442_D3CF607C 
X-CRM114-Status: UNSURE (   5.56  )
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
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add efuse to the AXG family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
