Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01CAC04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D0220665
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QkRPupQc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAgSh8i9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D0220665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=juV7yS5mhlZNKZcfoEjb+6iGvuDLIIGdw6kLvpL0OU0=; b=QkR
	PupQcRdEsqVCVxZm5efhJ0YUCz/Sw+mBZZx+y+ZT+e/zDLzsOkTysG0vQBt4bcm0JaS84380/faiK
	HteGfkSFrXkbOKY52ZInawTPC/BybJfCOA7rKxmwebNF3pmgBDqAJNA6qBiITAyehNXBWoQWgPhO6
	jEpeoVc4pcIh+9REJuZ/6fJxtEo9BMKEb2pN94/KQxGi2YwzrU89e6YDsHtseTguwU8opFtYvzlVZ
	Digoz31bTtSISjtsihLTuu+FYEBjFeIIfpANwNRbMbyHNzB2AkUBBxSPrCmEV77RW5ILgN+N9+ioa
	ziB3WdE286nBjYHvLtIOGh51sBfBBgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCP89-0007Gn-5h; Mon, 23 Sep 2019 14:15:57 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCP72-0004uz-Co; Mon, 23 Sep 2019 14:14:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id o18so14114095wrv.13;
 Mon, 23 Sep 2019 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/ipEvkTrDUAQZ6A9pj0LrEG9sqsJpRZyjqmkY4uDpwI=;
 b=aAgSh8i96OGbdM5LwzM1GgkU446nP7S236VaBnX9OkxS4QhsBI9a4qDoNc/if9ZPEK
 ElwXynkGa4OEfoOvhaZliPGOjQolMPhBPmjjhKYxYqm3fXjaqfKbeMDpvcO7MukVM63d
 n89B3qJHbaUV1VECag9lVca4gVrBSqhB6NktMa9cVHez0s6+0mMmLmWZaKTkQSewPFne
 wCUpH/RBNl6PPNt2mfVM+Eg4XwFt+YsQGZFei78N01wJRDREQW68K8pnzmDoHxybui4K
 IxU0DifKXjBCcickZHDaEQeS6ihiFew8iBdhtVcMsCKSzuJQk8IiqgAEy4k4rVGXqs/I
 It1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/ipEvkTrDUAQZ6A9pj0LrEG9sqsJpRZyjqmkY4uDpwI=;
 b=GWYeeN8JF3yUyokWkCfUq58AFbT24CV6ydNrmWWof1duQENeV6z3gdrIqMioCEqrem
 1D9xlREZIr9NtUCbWdDN5trQFi6MZoC7gsQu8M/bSWlNIyjKJQyZqd5rlfjRFw3sAyOZ
 uwlTfMhuicqt2AqBV7Yvv0Mx0jJZvaM/J0i3rYDUaDN3dEHJ2eS4AL+WKFqGsa2pUyEp
 /UEl2yft8aVS3f0QloBpZznU9dJzYL4t/stnJALRIANUMNTkA0xAZVnCJ62FI3dPQ8E+
 IITWdZZYiq7Y4Plb8AuokKa+8yJKE+71ESfJ84eQ/D4TV8ntoiXR1FY34yxEEOqsbXXg
 s8AQ==
X-Gm-Message-State: APjAAAUhw7rgxeSDn/6mi18lvMz/TaIvGrmjmCKpLObcoJTRs2+YC/Zp
 XUhk3DAiSb2Ibp3k9dOMWsA=
X-Google-Smtp-Source: APXvYqw9HAjjnuXBdavuZ0SRshgnZYju0QLuOimouoUS/1DbePdxtej/ae9JRg50dT7Zh7zfycLseA==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr12325276wrq.139.1569248086133; 
 Mon, 23 Sep 2019 07:14:46 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id h17sm7001700wmb.33.2019.09.23.07.14.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 Sep 2019 07:14:45 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] arm64: meson-g12b: Add support for the Ugoos AM6
Date: Mon, 23 Sep 2019 18:13:53 +0400
Message-Id: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_071448_638295_BA727852 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Ugoos AM6, an Android STB based on
the Amlogic W400 reference design with the S922X chipset.

v2: correction of minor nits

v3: address regulator and GPIO corrections from Neil Armstrong (using
schematic excerpts from Ugoos) and related v2 comments from Martin
Blumenstingle. Add acks on patches 1/2 from Rob Herring.

v4: address nits from Martin except for the vcc_3v3 node as it's not
known how to handle the vcc_3v3 regulator managed by ATF firmware, so
it remains untouched/undeclared like other g12a/g12b/sm1 boards.

v5: corrected some tabs v spaces issues introduced in v4.

Christian Hewitt (3):
  dt-bindings: Add vendor prefix for Ugoos
  dt-bindings: arm: amlogic: Add support for the Ugoos AM6
  arm64: dts: meson-g12b-ugoos-am6: add initial device-tree

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 557 +++++++++++++++++++++
 4 files changed, 561 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
