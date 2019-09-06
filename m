Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8573DC43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FE420693
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tpVwCZPx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwm8lWGd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FE420693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NfB1yBZ5ud2FmHhTfVcOOXoNE1DkOHx3oe2KOpQvuhQ=; b=tpV
	wCZPxuVX/g91n/6oc+JOq5SjfyhwUWGi2bhmQU9ElSXLlVj5ONW/nphAj8RaKZiRZaC3gegXeiJj8
	gPAaIPFGc4iEYvTHunfkVmLy846NSuO3mcdcpb2pjPiId8AR50OBTZ31JtXaBBFwgjrzIBvmmJIeE
	SieQJwzF8uhI82rtWGQRJkYCUBm0b3BUFa0L7MKYiL9ur7uYKxlVjLRwJkfNcFY1P52xqFj9YMsrO
	30RT3lkPGoI74vYx5hTvE/rZ1U0E8sJJwTD3rcQr8aHIgwOqhUJB/2d+dkuASLKrm3htHYrDhZGMa
	IT6d0LoNOshr6xAFaDClqXZaxzjgG5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6FIy-0006Na-Tl; Fri, 06 Sep 2019 14:33:40 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6FIj-0006BM-N3; Fri, 06 Sep 2019 14:33:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id 30so6801296wrk.11;
 Fri, 06 Sep 2019 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YhOPiGQ/jKMfAKNMmBIBmilg3dwIp+IShaOpXqxWprg=;
 b=Dwm8lWGdUfC0GE7Rtw818ox0Io/TAtpAZBPZwpQUuPsDnSRSlrYN+jCD9mNWWFgdK4
 j4a0eB5omczZilSZ7ulLqflJcjHmKtm3/5FwVDYfDWUd2NWx+8VgQvQ+VvXgkQLc/w3Q
 TCO8DOlc9P3rYEoO+da2Fy6JtnNOP/DK8O+ny8ekeDW6ksFcpwWBOlzcWISQm0z/0kGi
 OmIBA8Ebfswojg9WcOK8TXLX2mqd0DknsH7t/Rw63q9erBbkT7BAs46SvDpBskdxrlCm
 SPeQPK1kDW8kCxfMZWH+k0/Iju1spAq8DuZm7ePQ34F4UdBA4gi+IL2hVZ44vpKM6BIw
 byBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YhOPiGQ/jKMfAKNMmBIBmilg3dwIp+IShaOpXqxWprg=;
 b=SxSs1g6eMl2H4QrR5NAv8kxvXiyWKp7oLCrEFxA5a6v2+Lg8J4L30DtVRXCoEM6dzS
 qM7/jSSffZtFxdz15aBfYDgshRnHk1okfwjnQTDUMpWxbHEMeN9cJos1vihIv1qPtIVg
 M9Ap9PpCVzotqiagavaGFquImeRo24dwNyp+qIwnVZlu2vRC1pB52XW4fCmunBw6jcBW
 1/Au+tsMaj3yeY7+fxQ3F4PV+C96Zev4DwW1v6VB8BPsRsDmfMmaJAQk+QbWWlAWzGkw
 ZhnP4iO0mrbMQIZ37ELZQ9yy5Ti/WJm3ypa/qDGmXNWa+bojstlLjX/9c8n4Np4SW8Jo
 nEaQ==
X-Gm-Message-State: APjAAAW3SlXfxUulcipPRbCxK0Nb8U3jF/doYtEzvwuZc8IpsJd2wmmc
 g0ZQIlynJGwUPOJu/6xaEWg=
X-Google-Smtp-Source: APXvYqw8wZl/LTWgg0Chrhk0TDYioBtuoFUHLvwZXVA3/hte6Kq+jsmDp9J3p5QcsrlFvFLn+mterA==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr7431909wrw.104.1567780404007; 
 Fri, 06 Sep 2019 07:33:24 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id s9sm9300198wme.36.2019.09.06.07.33.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 07:33:23 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 0/3] arm64: meson-g12b: Add support for the Ugoos AM6
Date: Fri,  6 Sep 2019 18:32:31 +0400
Message-Id: <1567780354-59472-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_073325_778929_50421B90 
X-CRM114-Status: GOOD (  10.42  )
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
 Chrisitian Hewitt <christianshewitt@gmail.com>
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
