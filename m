Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC2FC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 08:42:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE10C21479
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 08:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oWdNBB1R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CnQot5xd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE10C21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uvro8kjfBVFO1zqLZs4G9YzQ5/BMKeJ+u1x+AB5E6u0=; b=oWdNBB1Rqypc/o
	pYan8bTZ7nrdetCcqJBkR1bUvQH9ZMB1XFolIkSHYkXapg8Dy9H7gY9kjBVggdWIVkcnDpbMWXDie
	EnNYt8axPdebA3tBRfqHqezzXKLQ1Gy41y8JUepDSygT4/N+v2r6qObqBsqqZg6teYxnyKqgkxUuY
	t3lcPONCgv2W9FXnO9ubzPMdmZoHc86CqH5jCgwpDJTuvLFEXOdMC/DfnyaX2eVEK69+OfjLV6/Gg
	cisrjcecQmd9zqsR2n6+EYx5WpSKtXomyrPspfu5L0Ayg4UJRlKPtFeOammVMGOSXTitnRdufG/SN
	Qr+ynbmGPC/s9EqgARnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gveVX-0003IY-75; Mon, 18 Feb 2019 08:42:35 +0000
Received: from smtprelay.synopsys.com ([198.182.47.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gveVU-0003Hw-5U
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 08:42:33 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id ECCD524E07B6;
 Mon, 18 Feb 2019 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550479349; bh=EyokDHzSQEus4/QmiZggZCaf/2wUoUJgTOJzk1Nvy6M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=CnQot5xdHVF8K++umldEKTyIhJOo+NxOFVIoMabakxXmiaOb3AuIQkst2UjmMVbMO
 G0Y0/fVwxXuSdun4HzQLgW2jHXL2Ye5ma6ehggyh9fjlESql65aV/oQQzg3ris/dK7
 lQ7ihfgviwXq9+wwYgG+L48gqEna8SZ05y2nBD1Ru799WoCjKUDEVFa6VunGAFACo6
 diyrowHLqO1ZtjW7kNLQPG1fOBotrLomcJ7sNymTFcxryy6Uf3WCGTpN+FTeMAuUiW
 LI5GD/XfrsAGFPPpuIJwojwzwfjIZTzXGonFNW/pyrXt9U9MgeMNygpsBLneM+X9k2
 SJqHVNJT/usBw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A401CA005A;
 Mon, 18 Feb 2019 08:42:27 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 00:42:27 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 09:42:24 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 09:42:24 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jose Abreu <jose.abreu@synopsys.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
Date: Mon, 18 Feb 2019 08:42:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_004232_215311_BE138D62 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: alexandre.torgue@st.com, Gpeppe.cavallaro@st.com, netdev@vger.kernel.org,
 Simon Huelck <simonmail@gmx.de>, linux-amlogic@lists.infradead.org,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2/17/2019 2:48 PM, Martin Blumenstingl wrote:
> Jose, is my command for disabling offloading correct?

Yes, I think so. What about NIC statistics and logs ? ("ethtool
-S eth0", "dmesg | grep -i stmmac")

Thanks,
Jose Miguel Abreu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
