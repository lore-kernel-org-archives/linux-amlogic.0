Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A738C65BB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 13:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3968520821
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 13:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lm8pAIDu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rWVnjeft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3968520821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ipJcvPpIDtie/7EW1iS1zN4sJ0PKOWDNPCYCO/tEAhQ=; b=lm8pAIDuADMHE5
	ICKgaa2Zju6CaOh4S8xpS6A9lAX0NS5xViVZvvOjZznO+zPJu6kbv7FEcx9565OGyM993vpqSjiFC
	4hBNvoCXQKLX1LLyhMl7w/vFKs6sV+/Om2ZqYo7PyOK0qT/HKhfqQSgGWBv3+OeW74Ax/aFb1s0CT
	4W9AZlXIjs/KG/shArjbkPrZqjeJnvObPWsGCsYdrqZ5Qb+cduALsWPBx9mU+jOD+X/j/9ByiS2Fg
	ubEJ3yFWAM2b12EXYIh7P64MWUuh3p9QkvscI5YQayBorg1249Y5iZyRfnK3cl/PX5WVv3ZRDdvg7
	D8IFQkeTvWQHFd4qIVfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWLWz-0005zw-BV; Mon, 10 Dec 2018 13:23:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWLWF-0005Cf-M9
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 13:22:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id t27so10441549wra.6
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 05:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFgo3cZiyawH9xdE2X8cjZ2ISVECpYqIFuLSf0Trn+U=;
 b=rWVnjeftjL65PBCJK2q1XRs+F53KpKGA/PbZiQARkvUDYSk+jws9SWQia91R6Xge8N
 6HqJ6zhHqJhAUo8FHwWjJHhJH9426n+yENrwYrABzcI1idEm5MyRZSP47pCc11OpyBzl
 SzlscosA54ha/7N2K8CZBVtmJ4hkHLLU78HBUdutbEH8X8u97rwHcBSGAd5z9jDDS7HU
 ndt5EgsxQC+ZQDqUCfPUEN1HMjrJqVPQSJ6g5RfbYCFzJNtUlKCyCkVtZ8Y5OMPns2Bw
 aecrkpuL28yRH1SFWIiGmNWlit38l9I1TiWhvRFnx9TJt8Dvykp6F++6nP3uiiueWNPc
 m0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFgo3cZiyawH9xdE2X8cjZ2ISVECpYqIFuLSf0Trn+U=;
 b=Y1bZnYoN/mWpSnXMrBJR4wUm/rSsMrAJMCv2OrZoVmH3mhdBR91LFkUux71lQZK+Q9
 m46dv2H1OJ/Ek5TTdd6oXWOvnL++jp+KZcMMg+k183Optt0gBFqoka3ZHkvvhoiq+D9I
 W4ACHwpujfqQ2w4v2Xn9PTXkC08nDbtTkHw7tU4CqCpBN8D9g1e0WNW3wQlV59Smw6Zw
 fNiZ4aS7QpO4gMQCbPRN8DLUGx690/zah/m8FpwJeRAtukWpKHlHK3FOOj3vSCewJ28Z
 4fmarB9qN2lTuny1DtrPwFnqWa4ts6/moZ/ffX5oVF26keN7nRp9PILAGWSdk0qDTSJs
 uucQ==
X-Gm-Message-State: AA+aEWbZsyxv8nv+yQEU2gjQarPFZWAMM+NbIDLAGHwgRxYb1PnJlpTt
 x236YuXjTbQtfyOvqCOqP5Qs5g==
X-Google-Smtp-Source: AFSGD/Xsxi+ia6g8WUPGZy/3/0qDawjuGqS+1FgMn6fvB0Q0c8LGJWJzjq+eJReKYfar4Y15DQjq+w==
X-Received: by 2002:adf:c711:: with SMTP id k17mr9369567wrg.197.1544448150145; 
 Mon, 10 Dec 2018 05:22:30 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l3sm11208424wru.36.2018.12.10.05.22.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Dec 2018 05:22:29 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/2] arm64: meson-gxm: Add support for the Mali T820 GPU
Date: Mon, 10 Dec 2018 14:22:25 +0100
Message-Id: <20181210132227.29262-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_052243_741252_BA1393D3 
X-CRM114-Status: UNSURE (   7.85  )
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

Christian Hewitt (1):
  arm64: dts: meson-gxm: Add Mali-T820 node

Neil Armstrong (1):
  dt-bindings: gpu: mali-midgard: Add resets property

 .../bindings/gpu/arm,mali-midgard.txt         |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
