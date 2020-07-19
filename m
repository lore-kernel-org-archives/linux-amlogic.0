Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515FEC433E6
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:14:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E70921741
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0FByiVaE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEksNnty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E70921741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LyhOs6ejlhHyTONfSvEfTpZRTelzmicxwgKJuxgztWc=; b=0FByiVaEX+xXpYnxcY4chMrWM6
	MCFQQGAIxnWRCk6zOf5U0OS0TOYQyjjOaPiz6PwPE43Ipz3U94mGr98Kd0K3xyoyzwMOWkttTTtFj
	vigIrcJe9+WEQ6vYHg8GhaZKkG4K1KuHKsIBgq1Vvxync4aMC3mBkEKpslVP6f5nCDGSBO9rs8DHJ
	DTFr8JePSpi0v6RxyAw9qisNIQPHuTOtzNr+WX+iaQi4S/R9j7EzIs9OnW2oYJ5xMVbLYp5Iv1//0
	R+cy/C2TYY2j3fhtsu/3bjmaYk0PF4tbAzejHvriYCru95VzvDXjIBG4pMvnTWWWt4OqfVR3uks29
	1ckz/P2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwyqi-0000xM-9U; Sun, 19 Jul 2020 02:14:45 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwyqX-0000v4-KF; Sun, 19 Jul 2020 02:14:34 +0000
Received: by mail-wr1-x442.google.com with SMTP id o11so14623219wrv.9;
 Sat, 18 Jul 2020 19:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GQcRfWfKvTiTGWJVDo12RjwKZPjrWsIntIaVCQbrSC8=;
 b=EEksNntyCoEPwQY3xYrBZWIzhKc83N3cgeGCMmSy6lWgOpmtTyaqdbZ8uSFaT8DMqS
 khuFZdI898/PNOK8pJvkJQgiGUDR4XJ/X9GcJyMqU5pDViSBJjVueJUBzq5+WnzeYg2Z
 EMeH3br7cED0PvsH8G3qdYz1OGlEW1oXeMFXiUYKd49x3TYDoqWj/CC6wYyl7ioFlbGY
 wA0XqXKZvGynUrcGiDKkxmjmCSPxM3iabJ0P9TyZrRUrayzt+aMNYzBAZfAQE0qDNYX5
 RzSLcUokWHaXGdhNApEBmvyuYP82CraQBm3fMR6oNuBhcnBJUWYiKFI1gXsCN2OsWAH9
 d5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GQcRfWfKvTiTGWJVDo12RjwKZPjrWsIntIaVCQbrSC8=;
 b=XpX30ORoN6B/UIOrMVzPG96QBUHa86YFZrMS15KQYfgWsFL2nazK6lvnWQfauaNI8B
 Of6kwrWlzqAvN1D74gjRqccywzldKPbEpnNIAQkes8g93P1XCJliDeJpev92+oiM5XKB
 D3p0kv909uQvI1xNgsx4VlU+E3MbZLNvTQ520sdwyHxJKeewWz8bv1+XXiCYyf4VBGrG
 lAVVoiN0xPa7t7z/6ErwzRSks2j3aIC+87R1UVRoVW8Gd++SV7KBzSX9cedaB3snpNNs
 KTzkh3sgfV76+rFN4/PrAQ7yb/avRhkIpjmT4fqP9XCHrvxJ9XZASWez0PuYzhQmkHig
 GVkA==
X-Gm-Message-State: AOAM532F3Yq+3y+0ns4tmgdzKne3jaj9HiJGwaIbr69tZHixcebfrpbj
 fyxlkMfSADtLhNNf4WD/910MOz2+
X-Google-Smtp-Source: ABdhPJywyrLKgJdRmHbXz3zHbMTBO4eBr791eYA8Ju6itSElwwx3fccwDoLOJ7ETLMkFW7guWQR+oQ==
X-Received: by 2002:adf:f18c:: with SMTP id h12mr15744657wro.375.1595124866592; 
 Sat, 18 Jul 2020 19:14:26 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id v15sm22078103wmh.24.2020.07.18.19.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:14:26 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: meson: add support for WeTek Core 2
Date: Sun, 19 Jul 2020 02:14:19 +0000
Message-Id: <20200719021421.7959-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_221433_777682_57E486AE 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: chewitt <christianshewitt@gmail.com>

This series adds support for the WeTek Core 2 which is a commercial box
device based on the Amlogic Q200 reference design.

v3 changes - fix BT node (enable-gpios > shutdown-gpios)
v2 changes - simplify ethernet disable

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for the WeTek Core 2
  arm64: dts: meson: add support for the WeTek Core 2

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-wetek-core2.dts     | 87 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
