Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8FEC4708F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C398C6128A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C398C6128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yl7miuwFIfheyU96bLwtEunHDocD2IClx5Ck0XSorWM=; b=dd5Su40Z7nb67k
	5lZbYdWC3rO7TAL+gqGuX/Q3hSMOoWJ46CkVCyKW1s3qsVnu/XsHNthhuf1Xx68bBRdbo0sV/NYPq
	oXcF+BX9eNDqjXOPfPzmIIzF4gVHvT3xdde/IDT92wHjkLpqyJK4DOTMKj5ku/VzVcH0d2GBRe2ZP
	e3hulMlQ2oj6EhX2Y+u51xi+WERSjhzOVRo5kRlG+4LovCYmtcwoIjobECli29uXitJh9zyHGidED
	bRGz0ErPHWpXmNKqlJ1hdTt0qHH1iXV+xvXAIB6chkxmdHTZTZC+pN984V8u2Gv7+Tjjnnr0gqcRi
	GtsHLJ1WWZvFYxvwTbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzXr-00FFzz-5M; Tue, 01 Jun 2021 08:14:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzXo-00FFz9-3v
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 08:14:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so931486wmd.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=QQ4y6l0qAWepmPVUhvkm/u0dFPTZaaw7StJzaOqDLDg=;
 b=qqj6sDWkIHSeBfbppn8qzbFjFWiiiUeuaHuSdKPJ7v55DidEvappol55TiXZlhZIQ8
 gdqx6oVLW/TGLY5iFsvG8ZWoooKzf6tUE2ncDMBwoxuZ/ZeBQRMDoImmmlAnKko2LFLx
 6p4nGZwRcY4K3Dj0RjM+UekVVYtXFyFgW8GhNFKWFRqqL4TL+NcetOcNBX2etJQP6l1b
 qOf90jiRACGGOk5GkZa9R0IRds6ZeUigUUsnssQVxxxnyH2PXYdEozK6BhHmZYwi0GNk
 II3+Gi2FWqJw2ja08UOZJjCQgm8mbvGf7Z/ux9TqdOsM82BQFpUdWLAzgfQp1AVEh2Ss
 5ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=QQ4y6l0qAWepmPVUhvkm/u0dFPTZaaw7StJzaOqDLDg=;
 b=ohTyFzHssvObLAg1fSODTynllSps1VOnTE40kqFLirLOj/o/H656leJyxvGs9AvMQz
 th5ZZxfDZyT4J38EedTmYB0aYl6O0c2fjvqjssNFPE2Rv0Xs4JRhmNSH/bQqrt7Jzs8f
 q/3aeUgre6YIPa3R8okGhLzrU97XtFZ20Bev6rGKDOwwYIQkyJ1nI252apmx2pr5lzmy
 FtcJknmk4ZR7/vYdF/QuWMRig1x1y0JqZuLCUzhhFDz0qf1Ra/Aan4K2RDELEWP88GIE
 7Bxiv3FAdSXdNtvuLpCj56rCrNwg0I41OF2Fa00SK/38HLUuAVNBrBujCt3SNY5d1zM1
 JcYA==
X-Gm-Message-State: AOAM530Cb3XpX6h2Qzrfu8sFG7eBFHmLybwqhhffYrc0Jn4egpJm9Dxv
 fw1hR59wrlTpbCO2RTda0Dd+hYG3jSSUIOI9
X-Google-Smtp-Source: ABdhPJyap1WnjfUsQObYORZKin9DsiSwzvUQtaHSkzX75Hzx933NVS/LfavOfFgQnjDQT8+y/E3U6Q==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr3315979wmg.19.1622535273038; 
 Tue, 01 Jun 2021 01:14:33 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:a3a:d001:6a80:207a?
 ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id s8sm2780871wrr.36.2021.06.01.01.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:14:32 -0700 (PDT)
To: whitequark@whitequark.org
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: #linux-amlogic irclog migration from Freenode to Libera.Chat
Organization: Baylibre
Message-ID: <cfac682d-13ad-d4fd-2bcb-678a1edc0d53@baylibre.com>
Date: Tue, 1 Jun 2021 10:14:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_011436_263220_C6BF2AB5 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Hi,


Like plenty of other channels, we are moving to Libera.Chat for the #linux-amlogic which was logged from Freenode,
If you could do the switch it would be awesome !

Thanks for your service, it's really helpful !

Neil

-- 
Neil Armstrong
Embedded Linux Software Engineer
BayLibre - At the Heart of Embedded Linux
www.baylibre.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
