Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C37C433E8
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 14:11:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D0F22B4E
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 14:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEv4ZVpu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFzccDYu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D0F22B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8OFCm2rSFikK58Fu919ESPe7SFCYCz/RZudMglJC1D0=; b=TEv4ZVpu8L/vqSDcuOjG0bN/mx
	pJuKTiFta2F4tYQeWS2Xx0R1OSm9m7L5CBH59ldJRSxfcWVb9BFiosoXdNVTi+iLec5V82DDNDn1f
	TDNq5rdsxDiJNMuhCZs7TMUxG2hbWX3BqMa0FqkbknQ0PTr8pgh9vdjXa3ReDRTpA4vYeC3Z/qL6o
	SktSR8WAfpH/KXAmOfJ17yH/3L94YIu0JrqyEKho2jFqTjCroaRVJ3x31SDnQzzJ/vr/EkqvFeA1X
	BnrZrh7nt6hGxoeMI4wj/exZiAktItpw8K3kv9OitoNESoOdXRnrP/kJkbEaUZKWwHyk5cu2ixT2B
	2Yl4JHcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxA1f-0002UO-7s; Sun, 19 Jul 2020 14:10:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxA1Z-0002Sd-LB; Sun, 19 Jul 2020 14:10:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id j18so19884022wmi.3;
 Sun, 19 Jul 2020 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uip36AVEEdpoEPD2bGpIZ4N4hcQoPUCcvc3HsI5Wl9c=;
 b=TFzccDYuwliwcOwsH9orW1yBomfu2xrMFclpekz/1pXYBPwEYWQ3bnBgEGGT2aKgYK
 upiflNUFRHfN9HJwtvV64tV5nuZYsYqHo0UDZ2FqsR8t+/WeRRVy0F3O8ucl5B/JF0Fe
 79vhT5S/xP2Q9+3ie4jxNy6ywpjgt8r9a1IQlvWcJLnCzdaPHr1fPFAlIFFL6tUiWkeC
 8Qomf6b49f/Z1LrEhHkitEQ1hRjgEL/PvmXfZwci9qnKdYH4I6Cz4Q4XDqA8zMuk7F6R
 3rSPHcM8XHhqATPjE8H+HGnvjDvxjk7Xc+hQTuFrWWebn4LYyZrqwRVLWnRDYt6NsM/T
 YQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uip36AVEEdpoEPD2bGpIZ4N4hcQoPUCcvc3HsI5Wl9c=;
 b=g9OGfrVPvBtb/3OyRfN8jTEkflnirIYrT4JBbwFNboAsmecHGk2HM8O2398ynWoTYT
 eNNiouoadOdTFYF0YAhqzAkDgijQgsqC54OcuQta7c6ol9o4KTCpQAm82xv2VSHhOPzy
 +fMC3VSddqO2giBxYabqOEw7gUIx9mtvaJUX+V23DItp+ObZZLhoafwZiNxBIx9D6Z19
 J17Xul3Sj0issJrgG/V1BQGpFl7SVh3BIfY8I0xIqUgVYDW1gpozvi8hPkO8o5zyAgQL
 UGaRDP0UiLzAF6fb3xmpq66ZkndfDRETLEiq4OODvphSBMxjJsidJX5Yje4TpAelvBQP
 aA0w==
X-Gm-Message-State: AOAM533+pyLJqHR+YolY6iW0Ws7Mr5hKj0jGUswQZyHUhvK7fNmnmqhl
 yoHMymlZPjx0UeKP5J9myto=
X-Google-Smtp-Source: ABdhPJwTLFyiaqp1ZwCiqde8MsEGRysxCu+C+kk/5JYdJm1R8uIYdw4hYLq0IFAAP5/R5NA66iUbfg==
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr17774561wmh.68.1595167838899; 
 Sun, 19 Jul 2020 07:10:38 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y11sm9215554wrs.80.2020.07.19.07.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 07:10:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: meson: add support for ODROID-N2+
Date: Sun, 19 Jul 2020 14:10:31 +0000
Message-Id: <20200719141034.8403-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_101041_757027_FD5C042E 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: Dongjin Kim <tobetter@hardkernel.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series splits the existing meson-g12b-odroid-n2.dts into a common
dtsi and dts, and then adds new bindings and dts for the ODROID-N2+
which uses an Amlogic S922X rev.C chip that Hardkernel supports with
overclock to 2.4GHz on the big cluster and 2.0GHz on the little cluster.

The series has a soft-dependency on proposed changes to N2 audio [0]
from Jerome Brunet so will need a v2 rebase once they are applied
(basic tests for this series on N2 and N2+ are with them applied).

[0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=311099

Christian Hewitt (3):
  arm64: dts: meson: convert ODROID-N2 to dtsi
  dt-bindings: arm: amlogic: add support for the ODROID-N2+
  arm64: dts: meson: add support for the ODROID-N2+

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-g12b-odroid-n2-plus.dts |  53 ++
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 493 +----------------
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 500 ++++++++++++++++++
 5 files changed, 556 insertions(+), 492 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
