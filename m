Return-Path: <SRS0=KqJO=BG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5BEC433E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 19:19:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26692073E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 19:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AeNSI1Kt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QI0S4cLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F26692073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1AftxBM4qQx/lMuWMan3i1N/npZuf70JZo7Aq2mELg=; b=AeNSI1KtcYPH2sguj2y6cGxokp
	tFgHYz/Q43teYrd6DA2QLpmXE6RhNoh1VVPQznl+4VDT12a5y/6oE5azFl0y++jzeLVdhNSyjHA5Y
	dXaJtcNVvEQkZasBArBw1lV1e2xml9BokI92y6gURL+VQEatbSOMllScp/Z4D4DDzg+DkAWhv3NA/
	d1q+qOUvFPE044YtdcB7XHNRyRMURXj9Cp00xyem4f3jfy5ORcQ1dPZUJp5jLhcl+FEID2kZXPVw1
	hYuBRfOgDpy7C4LY7RYwIfmAmqNNuzGWsv37iInpI3Y9uHnfVXFXvqX0+CbGyDeUYV5giZKUroTyz
	Qqwxf8Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k08eV-0004WD-3F; Mon, 27 Jul 2020 19:19:11 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k08eL-0004Td-M4
 for linux-amlogic@lists.infradead.org; Mon, 27 Jul 2020 19:19:03 +0000
Received: by mail-pf1-x441.google.com with SMTP id 1so9612769pfn.9
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2020 12:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vPONL8jDDWT9fXi/ahftLNzCw8+CDunpmbjxHjMrVbw=;
 b=QI0S4cLOJFMFEMp3YMT40BfDTK44eBLO9IamyTLDNIMJFckjEAwj+tpeXFoa2fKhXT
 hnU/xn/9sP2zotY5qfKqcycmp3AmpkB/UhqFsqGDflI2zIzfAOMgro2gKZqZ1ItWav3F
 /QWn0ai+icRoQs3x6pTkQP8hcf+gW52+Dj3tjeTLmxNuaPnLmPIBsTBeBUA5AqynVODe
 bCd1q59qfZVd/qNZk9/Qmzt+II4nVhYwQ9WrD4HXPFkTW1xPQ0p6bPdN0oolxTgDnUq+
 88XYdbBm9KajxW6efrDDIHkREHXF3+mouADVWxNnPJHpKbRSA7OXYdk4RRlWFixd3bkF
 UayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPONL8jDDWT9fXi/ahftLNzCw8+CDunpmbjxHjMrVbw=;
 b=BQYYXTm8A1NRRwiGMeV/sxzkamLRkOJXn9mrK5XUhDk/qsmIctkK8fHgWppDt2e/wH
 p/jMpZH4Kmrxsy3AHCwXAk5baQ33jZl6ZyvYWpLqTaFr52lPoPrKuCw66qZu7ocU/TLi
 LAUMrEai4guPmggSFtJAYmU3vINZYzu/9s3QjhqgdVNYtYD6lOj4NIKff83w5PRzZD8w
 FfHbLm7sziggH3emvBJonIgjtak7u4nolRfEcewlqWmD6ZlePlBtRYzHMURXaMAdl4WN
 EFTUJa6j9KOJYLbC2mE4EMSuSyuJ/QxnMdxjbPMpYPm9CIM+7w3VOU0xPqDQJCEo8FM5
 yUQg==
X-Gm-Message-State: AOAM532++mW35Ed/vYsweil8KWCUKwwnP9rdTIhSwmWe8tgwy8DQ+FaI
 WzN/I3bQoSp9lpNClsuuXOws9Fh5Xp4Hjw==
X-Google-Smtp-Source: ABdhPJw70u2U6IdBQSQNyaAl8QDp+dY7uPOtbnAIO4CpXehnlk2QP7ZIrrHIi3qtfG+wqY0oZLlWpA==
X-Received: by 2002:a62:3684:: with SMTP id
 d126mr10165410pfa.234.1595877537733; 
 Mon, 27 Jul 2020 12:18:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a13sm16560457pfn.171.2020.07.27.12.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:18:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson: misc fixups for w400 dtsi
Date: Mon, 27 Jul 2020 12:18:54 -0700
Message-Id: <159587752409.20735.1674533362096903330.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721013952.11635-1-christianshewitt@gmail.com>
References: <20200721013952.11635-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_151901_753256_EF257BF9 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 01:39:52 +0000, Christian Hewitt wrote:
> Current devices using the W400 dtsi show mmc tuning errors:
> 
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: meson: misc fixups for w400 dtsi
      commit: 2fa17dd09533d5d83201be3229a28c1010a8ea3e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
