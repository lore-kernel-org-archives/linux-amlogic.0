Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5179DC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:57:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD94218AC
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QupEP3WZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dt+aF7pK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FD94218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dWCwIDqGxMXrtXKDYtGc4aFGiGRsTV6nueMKllv7/p8=; b=QupEP3WZhaS9cX
	RDzAqPWQ/iQ6Ru/1CJo4aFURy7QSHRxKxHaySo9tPWE1K5+QKkFSJXw8/HitY34ujdHgliWgzRr4q
	8lUUk4GbbIc/7BsN3CSNk9oj8TTHbGFydCABOWPInemExe825t/oN8qqnZdIpNm9tmLShirChct7D
	n8SmY25s0lYEZmF6J7rgHaMOxLEdCCGTOHJJeNZz2mv/VfCm0QTmzuliVyuZo3eHchHSxKGONimAX
	ZPxeRmWt9VCRBiS4Suc7r2k9nGafhLL3krptDQTTKjfMNPwqI/kBFnGDL5GpThd+U2IxLKDg84Bz5
	ZidrHv6x52fgFC9IER0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4nKg-0007BL-36; Fri, 15 Mar 2019 13:57:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4nKW-0006qt-97
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:57:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id p8so9700172wrq.6
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXn3G/Dv/jMf0Zy1oiULOES6u/xLdhm6zlhAgPsnjl4=;
 b=Dt+aF7pKkaI2ErQpqL022yb4QLPaktxnpZqKzJp+huBIVCJQdb/IAoOrjE2uVfspbA
 SY8qEc5hYbgXMF/OfdhUDjztTgpvmqNwLDx2jx2KoCqtqYRmaRqxaLuszYectqennN+J
 fAq9xA4wwdFDZYpMh+HXpbjNjhp/2f/Tg3wLyU/lXrbP94f25PX6HFHFUtPN2ZmmLlCu
 F16V+5gM9RIUl6fdefzwgRfej2u4Ynu0rn7jfkO/0GWYjydU4o73FBKbs7V0bG2teCcI
 Fb9UqYJ+msVJkrc44pbpOjQ75jwhYIgLbIbo1THM0lABVpSEngNBeITPWgdqr3XjX5G0
 6HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXn3G/Dv/jMf0Zy1oiULOES6u/xLdhm6zlhAgPsnjl4=;
 b=IBNOV1Y5arE7scgBDXFrEcZ284nb9HS5U+OIWX/Mrl61nQ21swbRC/HfAg8X8EjUsL
 WwZPRJyHUIniwElN3D8STDlCFaQAmRbntWfSeRB3RnwFmqSIuWUSikxiDlyFj5sYFvQr
 PAu5/aaBs8Q6KV+/8L056OCoH/rlYXM3H6g49SWBhxidgqyk1IBsivXZHK4eYJQb+yEl
 y5RUjhlWFfI6VnBK3K8usnVePhOe1vSB8TaqcySoeRv4unuPVyphx/CoqCjW9WB6zSBs
 nlXqvQax8l8230C/hzfGRV5tgliaZ5Ovg0rlApXIa1vdUsWGChFzSmjuZjx7d7oCImAZ
 h9pw==
X-Gm-Message-State: APjAAAVrygAjBgzi4egiepZ417dysUoNmbN+KKczAX6F06moZK9lwgNO
 LplJ2CwLOdRl5nNeQts3WIRqrQ==
X-Google-Smtp-Source: APXvYqwZ40ySoOedl3XMletCrmpyZ4NeWqtqXb4cL0ltD+zaaaZ9dJz9ZkiUegy+1UbPTPzhkNAA8Q==
X-Received: by 2002:adf:e3ca:: with SMTP id k10mr2475797wrm.277.1552658218670; 
 Fri, 15 Mar 2019 06:56:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a14sm2131900wrx.96.2019.03.15.06.56.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 15 Mar 2019 06:56:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/2] arm64: meson-gxm: Add support for the Mali T820 GPU
Date: Fri, 15 Mar 2019 14:56:53 +0100
Message-Id: <20190315135655.28359-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_065700_321534_24BFCC91 
X-CRM114-Status: UNSURE (   7.39  )
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
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds :
- Optional reset properties in the midgard bindings
- Mali T820 Node in Amlogic Meson GXM DTSI

Changes since v1:
- Updated midgard DT wording following the recently submitted 
  bifrost bindings

Christian Hewitt (1):
  arm64: dts: meson-gxm: Add Mali-T820 node

Neil Armstrong (1):
  dt-bindings: gpu: mali-midgard: Add resets property

 .../bindings/gpu/arm,mali-midgard.txt         | 14 ++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    | 27 +++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
