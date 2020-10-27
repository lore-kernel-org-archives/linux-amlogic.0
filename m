Return-Path: <SRS0=N8xU=EC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EF4C388F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 16:40:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1811218AC
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 16:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vz7OOzfj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eajqUruj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1811218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ac7qeknQbND7jBTHMAddt28RGze1dj0t8nI9fJMDIXY=; b=vz7OOzfjiA7HYfWAA155M8hE+I
	u4DMSNbEmjNyueACwoSD6O4efFVLDkcaqhBGwRJouvwSiCt8p+Rk0pa7fcPjjjpZMn70C4jWMacAc
	g0Ez670dLepHczl1s6u//BQTse58xOv6/OAU5CvzSHrd2kZBrkBnpswgHZim1/VT/zNNpx+vRBC4w
	JojM1pl8D+jEzA013C5KoS0BgRejuhBtaQueDdfD8xgVisZheCqgOMl1P3dn+J5RqBLCC7rL7aFW1
	xSbuGQGQ149X8NzAg4ebyXER7HEYFYBebZYVvl9eBlXjQmRioZTKrN27ctqnJOH1kdN4HJpXLK+7V
	2Ap/E4vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXS1W-0004lr-Eq; Tue, 27 Oct 2020 16:40:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXS1T-0004lN-Nz
 for linux-amlogic@lists.infradead.org; Tue, 27 Oct 2020 16:40:36 +0000
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BA852076A;
 Tue, 27 Oct 2020 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603816834;
 bh=GeVydqQdmqF4mrnnUV8EoH6D0rgd0GD2fCsWLHqwvO8=;
 h=Date:From:To:Cc:Subject:From;
 b=eajqUrujF1byPf1XOlg/ePW4E5wsgT/qfSk2bJxE4t/Cjo4rPEXZZ+BWgH+6foZNk
 IpmP93XAz9sxEgSn2pgPLLL7+7HIZzdlhrZT1/P2eHjemPsglw8rGf7z3/bq7Zapk9
 GwPXR/v88+dWOHQLKVV1D11PWcv47Fqz7M5xYsH8=
Date: Tue, 27 Oct 2020 11:40:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>
Subject: pci-meson covery issue #1442509
Message-ID: <20201027164033.GA184666@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_124035_893874_3187AF46 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Yue,

Please take a look at this issue reported by Coverity:

340 static int meson_pcie_link_up(struct dw_pcie *pci)
341 {
342        struct meson_pcie *mp = to_meson_pcie(pci);
343        struct device *dev = pci->dev;
344        u32 speed_okay = 0;
345        u32 cnt = 0;
346        u32 state12, state17, smlh_up, ltssm_up, rdlh_up;
347
348        do {
349                state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
350                state17 = meson_cfg_readl(mp, PCIE_CFG_STATUS17);
351                smlh_up = IS_SMLH_LINK_UP(state12);
352                rdlh_up = IS_RDLH_LINK_UP(state12);
353                ltssm_up = IS_LTSSM_UP(state12);
354

CID 1442509 (#1 of 1): Operands don't affect result
(CONSTANT_EXPRESSION_RESULT) result_independent_of_operands: ((state17
>> 7) & 1) < PCIE_GEN3 is always true regardless of the values of its
operands. This occurs as the logical operand of if.

355                if (PM_CURRENT_STATE(state17) < PCIE_GEN3)
356                        speed_okay = 1;


"PM" seems like a funny name for a link speed.  It sounds more like
something related to power management, e.g., D0, D3.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
