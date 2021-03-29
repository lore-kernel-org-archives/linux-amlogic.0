Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54483C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3006198E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3006198E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=45rcmm/+2PcZEzQduvLiFD4jAyKtw9oyT8TTY3iQewQ=; b=aRE3hC6PBpGVze69GO7/quUxIj
	rqHUGBllyPVxxCWh88owSp6xs3NtnY16ySByyHsv6cfc87SdveUmZWUkPlEBZsF6L1q1JPP66tAx8
	7Qp2Lt6CzDNubUJ79ci7iJE8V13rzCv6qjw8YQsGD/DbwG0qcsKBCLsrPl33L8znmviSfjhNI5rwd
	sbBJRz/du+Mv06g6Y6/qIjL7ys2V0c7RC4dK+9oslXqwn/6gOe2/y550uEekc6b9IARUCmeG9DIu0
	1zC8ts99XcJzbgKrsw+Ksjw91FWN8BW8rS3wGhh6Qs4TTsnE1VtU4dZ8vvkb3puxVI7QhNSSiVXCF
	Zv/6QOGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR17I-001shb-JZ; Mon, 29 Mar 2021 23:16:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQuVj-000knL-Aa; Mon, 29 Mar 2021 16:13:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso6964161wmi.0; 
 Mon, 29 Mar 2021 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vumQFbft4TUafDDrGaQYDL2MVOcmMkJAnn1vxeYAC5E=;
 b=ffNu/g88ZA6KOYVXv8Lsu6lVSv0qtWWmEHUdeUR4wT94EBzXxxW9HCfzLRSqpjBLKr
 8GxL6K/RyLmxg/n4ZB0MG971BDRCVsAuslPPQZY+L7DZkgnQVbI07kPqmWeiDpq2eYqk
 F16RrwcKxTA5rEttuftCPCX7d9X3D9XjM17eRQLmXmP0wwQxSXUq5hKdr8XMaUlV2r4+
 3Opn5bEqYh38J/lUQF744l57/8Nlw5L7KZMjjYdIdvNAGeEF5eeKb57lqLlZ33dthW8/
 +zk/qBafapF0a9YLtdUyMeXzWXifmSGY/rGuo3jeOmpobSLhtKTV349M2rd6MZscaJHq
 EPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vumQFbft4TUafDDrGaQYDL2MVOcmMkJAnn1vxeYAC5E=;
 b=GpemFvkmqxoFZfP5UL0d8hO6U60oiVG9PerIEYmrBIKqkJnSptKFK0GJvMECVuZ7OT
 9IikGHfd4B5YC0wBbqjd1eru6rxf7iRu9D/lG/W2X6HqmEHc2u00cbcH3tQH8KSWC6Lu
 t7OGM70wz6/+Nsirm1r0ZY84HtGAn8mGCBSf4upyx/o/Qqsv+1+GhNNGJA8ffogvLGWC
 2+ZL1j3SwQXhAehIJ714IrR5Bv264qObUq7KUyF4Mdx3ZFPkT3gktQiflAsvK+b9ciUv
 4la7DZZNAJxBm8/9/jtsB1UVYLRdnD7PFErLlgp30wu3A7sQhB3ckgIXVFwUqoFIwojP
 jZmg==
X-Gm-Message-State: AOAM532e9aJ9ihMfSw21NjEGgCg9Dg16V4wYY9R5IDeu24IumN4hPlQU
 I0uuXN6NxL/U7HZRPj4w91I=
X-Google-Smtp-Source: ABdhPJzRmUhFza6e/7DKRAMWFBmKOgWUb6fdMECHk398ZIn7NJxTfemfK+CMzjqLk48PjMSfCimDyA==
X-Received: by 2002:a05:600c:259:: with SMTP id
 25mr25764293wmj.5.1617034381001; 
 Mon, 29 Mar 2021 09:13:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a6sm28570964wmm.0.2021.03.29.09.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 09:13:00 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/3] arm64: dts: meson: misc ODROID-N2/N2+ changes
Date: Mon, 29 Mar 2021 16:12:53 +0000
Message-Id: <20210329161256.31171-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_171322_822557_9B3294C7 
X-CRM114-Status: UNSURE (   9.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series cleans-up and submits some minor patches used in HardKernel
Linux 5.10 and 5.11 images for the ODROID N2/N2+, and fixes a stray tab.

Christian Hewitt (1):
  arm64: dts: meson: remove extra tab from ODROID N2/N2+ ext_mdio node

Hyeonki Hong (2):
  arm64: dts: meson: add saradc node to ODROID N2/N2+
  arm64: dts: meson: add GPIO line names to ODROID N2/N2+

 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
