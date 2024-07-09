Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBACFC3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGtpXI5lxQly57mk6KLxbecGH9Qe85i/jUR8RnoWk/c=; b=1fkiyelEpsR/97
	ibP5KkwMytFWW4Yzb37p0r/4v76vFRgHTifjWVE/cIgGQf5mA/X3mkCo0CyArMuQwJYj47ItO6flJ
	EbnHumi2RDbAdj1ZNlG9d3dfuz832Np02lktAkw2VJVNjb2v3kNmGcDnWXSiQ2NgcGxXsZx57hlAz
	6O0ragDoVMBuhWdytFtjQKnEHwIzekndeGEbxylTu4h+fv1f13wt3JeyliegfVu0IzFel5+e2lz5g
	rUrK9eDoGSfowY+s8BaL+C/ERXcKpBrWxKTi53tRtmLx5S21q/ehztn/F9kc2qclTdWvGk4IoFRrU
	D0m6J2jV/hTvFOAq4MtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDkF-00000007xlx-006R;
	Tue, 09 Jul 2024 16:31:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDkC-00000007xl4-1PoO;
	Tue, 09 Jul 2024 16:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0020CE123E;
	Tue,  9 Jul 2024 16:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8020BC3277B;
	Tue,  9 Jul 2024 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542665;
	bh=tdS8Vn22uaabOoy8CB56E4+Y+7br+AOHsAEojPseWvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLG5/nrXISOG0feH6AuiKbQRZqSJD8t7EJ3x333nX83kmR6Gs1ROGr/yeJdmeCt2e
	 qeW94m8B8yQd5SxJGSwWMQLze6HO4ROMdO3SUrfkfLbYNBvceV+Rk+vj7T5+OmZGW1
	 SJhp3cbUF3iqAmBHkg+248dNLBeapquzxA83PvJ85bFaAf78ItlElM63hafTxz8uIr
	 7n4DI/Kld6tVeo8qKObMatPc/Ek3qxzi/7EGQXNqafpgLLtR8fH6Vm2kZZgi8OCirI
	 DrqNgcVDwu64ObWBd9fOghN2tXwKjHMSUj0OzFjh9/SWOErQU80ZGTlBPFYHE75NZj
	 qqS+BnkMWXGWQ==
Date: Tue, 9 Jul 2024 10:31:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: daniel.lezcano@linaro.org, linux-amlogic@lists.infradead.org,
	kernel@salutedevices.com, khilman@baylibre.com, krzk+dt@kernel.org,
	lukasz.luba@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
	mmkurbanov@sberdevices.ru, neil.armstrong@linaro.org,
	martin.blumenstingl@googlemail.com, hkallweit1@gmail.com,
	conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-pm@vger.kernel.org, b.galvani@gmail.com, broonie@kernel.org,
	glaroque@baylibre.com, rui.zhang@intel.com, rafael@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: amlogic,meson6-i2c: add optional
 power-domains
Message-ID: <172054266337.3753781.16130996955129406536.robh@kernel.org>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-3-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708194808.1819185-3-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_093108_570185_7D705DEF 
X-CRM114-Status: UNSURE (   8.95  )
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


On Mon, 08 Jul 2024 22:48:06 +0300, George Stark wrote:
> On newer SoCs, the I2C hardware can require a power domain to operate.
> Since the same compatible is used for older and newer SoCs make
> power-domains property optional.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
