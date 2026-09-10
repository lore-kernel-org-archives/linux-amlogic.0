Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1746C79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m4KcINDhP798m5uLxr9MZcsSzIgjrmdx7CAedq4Q030=; b=ZzKkccAcS6EJhx
	GzHkgwv8OhKUeNvaTw6xJp40MiUxS+iwOv8/Fs3mRUzmxcWA62DmI6ggYbCWguoRlWQpRp6cfnNzB
	HovoktES6dvqMJsR6M5Tbivj+OTszHsYLmb051JHDstIXbmyXMKoZ5ljUJG0mxZxlnepQqs/6DuGN
	NKLAJ/ZqCsWKf24AfQubkRQASzAMCP9J88jZ/4a3aYglnFflA3HCsvQH0cOzmxS/ice/j9xzQ8Ins
	7m9klt504XQTEk1fa24Xf2+grJ8AzwMc6p1/e5AfUigKxC2oiDF0AenM4qWcNZGyeSYFkMwxyBLLd
	7JNaM9zL5mbycsE8vkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YR0-0000000DY6P-3rsl;
	Thu, 10 Sep 2026 06:38:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQz-0000000DY53-3EOC
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 06:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D490760211;
	Thu, 10 Sep 2026 06:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80AB1C2BCF5;
	Thu, 10 Sep 2026 06:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789022336;
	bh=6rWt1xIppEggcuvcPQEJmOPBQ4LH6RI7xBI39Qw2D18=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=asQKg2jsOnk/gn+/y2WbW3SVRO/fQiIT04LV6QcFqSc3zmiYwvEhivMyjrzr6B1SJ
	 3TZnVgdJDs567coBRI42tEG3iy+8zSqu2eCiA7roiGGFyN1/RuOWhsulwguA+mfLyw
	 LbLz1sarc7oGRsWkv4dFDtJjaINUqtlxWzShMW+fiK2yNKvgsjOz7GiMbv3WqYh3N+
	 YNjsRJFA3pT4fIQo3SDEQ2EmnU9z4RNYEeTcSB18Z3qrnKsRUv1qXZkaCexzKqzv2J
	 784p9aRJMYySZ9tOhFRtNgRi1xTimzZkHcK5KyGLQNjVuj8rgz76tHKq8kmpGklf7B
	 n5pheqd3MJMMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B05FC79F9F;
	Thu, 10 Sep 2026 06:38:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] thermal: Add support A9
Date: Thu, 10 Sep 2026 06:38:51 +0000
Message-Id: <20260910-a9-thermal-v5-0-892d798723e1@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHtQomoC/2XOTQqDMBCG4atI1k1JMmqSrnqP0kVMJhrwp8QiL
 cW7N0qhistv4HmZDxkxBhzJJfuQiFMYw9CnUZwyYhvT10iDS5sIJkomGVCj6bPB2JmW+lJY9CU
 azT1J4BHRh9cau93TbsL4HOJ7bU98uf4ywLaZiVNGnVSlA2krU6ir6dqhDvZsh44soUn8seJ8h
 0XC0jkLUHFeaXPEsMFijyFhhtJUHnTOEY443+Jih/PlbeWtVoW2Xog9nuf5CxtsCDJdAQAA
X-Change-ID: 20260703-a9-thermal-f62cef6ea91f
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789022333; l=1789;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=6rWt1xIppEggcuvcPQEJmOPBQ4LH6RI7xBI39Qw2D18=;
 b=cPYPTk9cHc7HxrfdgYtSEMBIWA3bvYx2u8Gqm2NebjiOtJSvooIwvr3BHhQvQynVf4p9soQ1L
 QG9+0pEnqncD0Vi9pzyPkh982X6XnFK7ujY1u23mRAlKoMOTqhklOnI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Document the thermal controller compatibles for the Amlogic A9 SoC
And add driver support for the Amlogic A9 thermal controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v5:
- Check enable clock func returns and set the restart time of register separately.
- Link to v4: https://lore.kernel.org/r/20260825-a9-thermal-v4-0-d8fc9859cf22@amlogic.com

Changes in v4:
- Fix type error in comit mesage, and set factor valid value. 
- Link to v3: https://lore.kernel.org/r/20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com

Changes in v3:
- Binding: add restrictive conditions for clock, and remove remove "amlogic,hw-reset-temp" property.
- Driver: add private data reset_temp instead of get value from DTS.
- Link to v2: https://lore.kernel.org/r/20260811-a9-thermal-v2-0-7ddc33b11b9a@amlogic.com

Changes in v2:
- Fix the spelling mistakes (clock-names) and reset-temp properties is visible to old chips.
- Adjust the clock enable sequence in resume func and remove the clock disable in remove func.
- Add the judgment on the divisor zero.
- Add description of support for over-temperature reset for old chips in commit message.
- Link to v1: https://lore.kernel.org/r/20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: thermal: amlogic: Add A9 thermal bindings
      thermal: amlogic: Add support for A9 thermal controller

 .../bindings/thermal/amlogic,thermal.yaml          |  27 ++++-
 drivers/thermal/amlogic_thermal.c                  | 121 ++++++++++++++++++++-
 2 files changed, 144 insertions(+), 4 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260703-a9-thermal-f62cef6ea91f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
