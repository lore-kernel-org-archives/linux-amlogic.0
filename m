Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD01C07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228F620851
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLrmZseQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LI/UOUKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 228F620851
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jqQxabGk29u2wGjE5o7cpjbQzYdORsQ5LZI9WgRX+5c=; b=hLrmZseQqdnawp
	yzsL018KkKXjRnPHjeZnOu4NkwR1gnS4S62k+uI+DKNEh+5eT3n2iLVTiv+ZsEYUrBQA5I92whYtc
	uC8zPmdmMVYf+Dl4yWsgfxmqKr6qpTukWq81/w4yzVT+vRIGAfFpt7iShGV6c/L3Xt2QA+lLCbBLg
	WAe2uF/+UP53FqtSRTnJ6Md0hDEPCOhzCbh7DpbB/sCA0+z2HgjjodG7bnon1BjGg4SO/gU61wZ8z
	PnL3ftf1w4ZERvLBdbAm0Ez/HiWQe8/ehS2Gyo07gXvFE+0V2IRMHckaOmdVHZZJ3oDDV49qJD0iC
	FhkaUIyfPuwIzO2Nw0gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbvs-0001Wq-8G; Sat, 25 May 2019 19:02:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbvn-0001Uu-QU; Sat, 25 May 2019 19:02:13 +0000
Received: by mail-wm1-x343.google.com with SMTP id z23so8063600wma.4;
 Sat, 25 May 2019 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMgRwBoum0Ejn339EXDQoU9BYTUMpQqabDlvOkJFkRA=;
 b=LI/UOUKEetrDqZGCWdjAdtJcMs/WfNEF/yvH0JEZyz9Bs4zcUNdVEcw5EX9KDVAK0I
 Hmp8mN3pH1u6IKYCMkFQ7FNhBx5xhAiVUB8KjboEdh2NsZG8eKLdtzRkltjRKiTp/Cs1
 Y6dncQe7+lN/1Ia9pYnByRlCp1sPe1IkVhKzUczHmlHn0z84O7RHWJGRI0qzG0ZNBiK9
 LGm8sDARfU4nAVttZAXUXxABSceTuj7pflgl8fUWEJnekuRma/b4GXocdaHFk7pHqtIH
 zK6w+le3nOIyHZwlCNRD7y9FPQhbo3Ogv5/0TG7O6tg1+A2zdEtizmI9k90fIgYW67tD
 PmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMgRwBoum0Ejn339EXDQoU9BYTUMpQqabDlvOkJFkRA=;
 b=Gyg1UV14e6tBSbJqBUN/872neoa0sNPqPW6cblXFuGIK0QoxABbIVd3SylFGXSEZJQ
 c7/VPrXN7B5GWvdbygpzTi8j9l/Fk54kswtJvP4tq6NGLWVW2HTeEwSfetcTgJSXx14D
 n7spkdnj14diilEacZtYHe4Jt3FKoucNyvqkHMPmXevsvGdmgiC/u7bLwdmJaA3Bi639
 505CG9cU0cnP8eq6b70pkyME1Gn2B+LmDY+AQGxNKIi+2oVTqrEkWUQukSpBkMqZTULh
 SX1UZgamL9dRkpgU1CFtWOuMpiRiy0SExNTwYwtKnJnFqC1v9M0tDpqbN/xb/WCEJO9X
 U6OA==
X-Gm-Message-State: APjAAAXz75N5+bFdQ+VQe4jdtKVnUig+pcjS1t7G9MB52H8odTgNRBD8
 1U4L8fp5gGuNeqOgBG7glgk2fD7B
X-Google-Smtp-Source: APXvYqzsGZFaNFf0zprRY/s7WMFdZxHwCQ2PrEP35RUVc95UKMBki5ybO45bWRmlM2Em8nC8+Ua8Fw==
X-Received: by 2002:a1c:2dcd:: with SMTP id
 t196mr20662035wmt.141.1558810929981; 
 Sat, 25 May 2019 12:02:09 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id f2sm6870426wme.12.2019.05.25.12.02.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 12:02:09 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/4] ARM: dts: meson8b: add VDDEE / mali-supply
Date: Sat, 25 May 2019 21:02:00 +0200
Message-Id: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_120211_878113_0D82144C 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

EC-100 and Odroid-C1 use a "copy" of the VCCK regulator as "VDDEE"
regulator. VDDEE supplies the Mali GPU and various other bits within
the SoC.

The VDDEE regulator is not exclusive to the Mali GPU so it must not
change it's voltage. The GPU OPP table has a fixed voltage for all
frequencies of 1.10V. This matches with what u-boot sets on my EC-100
and Odroid-C1.

Dependencies:
- compile time: patch #4 depends on my other patch "ARM: meson8b-mxq:
  better support for the TRONFY MXQ" from [0]
- runtime: we don't want the kernel to change the output of the VDDEE
  regulator to the maximum value. Thus the PWM driver has to be able
  to read the PWM period and duty cycle from u-boot. This is supported
  with my series called "pwm-meson: cleanups and improvements" from [1]


[0] https://patchwork.kernel.org/patch/10960283/
[1] https://patchwork.kernel.org/cover/10961073/


Martin Blumenstingl (4):
  ARM: dts: meson8b: add the PWM_D output pin
  ARM: dts: meson8b: ec100: add the VDDEE regulator
  ARM: dts: meson8b: odroidc1: add the VDDEE regulator
  ARM: dts: meson8b: mxq: add the VDDEE regulator

 arch/arm/boot/dts/meson8b-ec100.dts    | 31 +++++++++++++++++++++++---
 arch/arm/boot/dts/meson8b-mxq.dts      | 26 ++++++++++++++++++---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 27 +++++++++++++++++++---
 arch/arm/boot/dts/meson8b.dtsi         |  8 +++++++
 4 files changed, 83 insertions(+), 9 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
