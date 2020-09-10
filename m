Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16295C433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 07:52:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A614D20809
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 07:52:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tbAgz00x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNom3T6Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A614D20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cJqbQ+wso9s168FL3lZ5nyHqdnov9/SCZuvE6JXvgFk=; b=tbAgz00xbXV7zid8TqartpLcQ
	0ytapQ9EClbzpHdH9qBuZt1XjCCuT6x3ofWmiGdQxN2asr8qYNAq1OGBS6AxXhDl4TEJcdWv1wuvi
	3zS5C76hHrrD2YcZ7TrWsF5DiLJ50LDdQ2vAU3e85W4Lych1W1EQXaJZEksSEmrirV2EtS6TItyhg
	Y7owbzLC087QKtHDhr+wuxi8yPGFt6i91yeWvtbB/sN+/KAI/4emtZPsUmNd7cDTn1LYsuXI5wdP6
	v+21PHHTpaXPIH+MabMLYKbGDAJwhBMXBd2WNq7fGYXuf/NH37r2cr/8L2r2TNkEEtRkITxV7FpQr
	Bg6Ef6Vow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHNY-0005At-RN; Thu, 10 Sep 2020 07:52:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHNX-0005AF-3O
 for linux-amlogic@lists.infradead.org; Thu, 10 Sep 2020 07:52:23 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4208F20809;
 Thu, 10 Sep 2020 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599724341;
 bh=ijucEkauTD7Oq3ltMK6SO/FeIANicHwPTK7VsIGPYl4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LNom3T6QTTA51pYBdbKQ74uZJ5by1QMhxIkfUmDr5vgd+7DNcUvRzfHinj7TCXRN3
 DRqktnRsVwlfk8KfE23W1oaQaO+P6lala2NVBXFimEPYfIDcvNC0IVBpmI0Bchc40+
 /ClkcpoeHh/P8J5a0Y2xqQz5+pp88mJu70SE3be0=
MIME-Version: 1.0
In-Reply-To: <20200828154735.435374-1-jbrunet@baylibre.com>
References: <20200828154735.435374-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: make shipped controller configurable
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
Date: Thu, 10 Sep 2020 00:52:19 -0700
Message-ID: <159972433977.2295844.12910258806178190962@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_035223_228514_7AAAF3C0 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-08-28 08:47:35)
> Add the necessary so bits so unnecessary amlogic clock controllers can be

s/so//

> compiled out. This allows to save a few kB when necessary.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
