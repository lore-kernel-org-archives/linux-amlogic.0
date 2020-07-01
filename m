Return-Path: <SRS0=bxQo=AM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5ABC433E3
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EEC2073E
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ji0lE4aF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wbqk8Ph9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EEC2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMjgIuZp784PXqg0/51ZKlWAAi3gQLu74Kp1AcPl25k=; b=ji0lE4aFYLv5N7XukBHyMB5QXg
	dHmqhJhMDXawg14ISU1w5FhWaULjMOmHwT0u+zd+cwdud1uMtjZJ9gPulh58meaiyqm7uOBC3qGIN
	v+YdpmE4+i2ySVUqMON4FSTxPtNtIEoiPcMaXqPNnZATRu2mL5kyWIX/DuQRqmxAGWs3/Ie3FX1eP
	bfOi9HNyQGcgEMwFbjppsxlyw8ub2v4eewsjE7VhppmOUotqOsc7eI9S8KvJgFCVYHdp+3lqEVqtb
	FE04K54YwgYEbGBi1qo6xct8+71jJmrLYnvSjQbbPktYd66Dms93DZPVMPJGRX7eHWrRRG/8edDfu
	qQ6vxznQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZJm-0003GT-UE; Wed, 01 Jul 2020 09:46:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqZJd-0003B0-DI
 for linux-amlogic@lists.infradead.org; Wed, 01 Jul 2020 09:46:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h5so23103124wrc.7
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2020 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WsaJCqMmyft0xsDXaDX0E0lFydjZ70ccL/4pSLdMeMc=;
 b=wbqk8Ph9l/AGhRL3xUbGbNhLrunVeFNmXALYi0Gg56El/K1rrk3zzHtIf/sL1VdR3D
 b3pBroqn4YTxTHIIg1cvze/q+fzpvAhGEZDjCHSYCcq3D5LN9cY+N8oqtoWmi3wp1Zi/
 /2XzsEcLLsPKDqNJ0Iv8Pt5nWZ6zDwps1akv3mKqrH2Cy82IA0v1BCdPm4SgSazw/GwS
 nlL23SjmZepHaJdtV+jbzGPq7hH9hZaEBSgS1gTZjMW3gva2JtXqB+uVIkeRsrWE8+iR
 53WDNdZ+PSHEoUKREoeFk7IeT7n9qSzJiWpx1Q/aBY/EIKHhYk8bNIF+wmeGtkT/lul2
 P7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WsaJCqMmyft0xsDXaDX0E0lFydjZ70ccL/4pSLdMeMc=;
 b=HFaxGNULs3OMYYl2gmRUmu7VdSgy+RJTCBhoTykUwtD+dFsg9UoXSe74BRroUw5quN
 IFjXffJcZZ9eovU/Q230DjvAb5hiirScHbu2WrBr+8iFOw/CwJbDjIwI8pwKmECpEug5
 iH4YkRKlTuKveZebvzo3vCE7+upkp4em4a4HInxneLAp07ODrXROif5uZFX+NaX9HnYr
 uvXkqF/CJkjuxB5eNl03wxeDzaTCxjcZHMAttKL1TfSpW3eobJqUlo2LyMkttnuL1+zz
 V7Euc3LGqyguTzkN+kDsrpCGHBNxIKYZxzxIpflj5kx8bSPYWmqwd7FuttKoaWvnHHO7
 cL2Q==
X-Gm-Message-State: AOAM531sz0xKBUEkH7SFak0xlhY48yFp3Yfd4JkpNs+ISaLMSnE8jdhH
 P7D/1Obh7euphakhJh39wXj39g==
X-Google-Smtp-Source: ABdhPJxK5vIN7UeAUbYNFQLTvAZEkw2V7bkjRvhqNfHoOiZLWbl8nRVLfm7/OR/9iJN3Dm6TZLb17Q==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr2853363wru.147.1593596762403; 
 Wed, 01 Jul 2020 02:46:02 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f13sm6270472wmb.33.2020.07.01.02.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:46:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: odroid-n2: update sound card
Date: Wed,  1 Jul 2020 11:45:54 +0200
Message-Id: <20200701094556.194498-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_054605_492341_936793B0 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the support for the TDM loopback and audio on the jack
output using the internal codec.

Jerome Brunet (2):
  arm64: dts: meson: odroid-n2: enable audio loopback
  arm64: dts: meson: odroid-n2: add jack audio output support

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 136 +++++++++++++++++-
 1 file changed, 131 insertions(+), 5 deletions(-)

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
