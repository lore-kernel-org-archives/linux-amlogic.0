Return-Path: <SRS0=mJnT=6M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C53C83004
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 09:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACB4206C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 09:34:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KVhb6kCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACB4206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFbhYrMwOexff2LYH+Uu54DiZRVfzcFsAomMLBW32mg=; b=KVhb6kCnGtM3AK
	6zHPFwdVVf1NhVz4SrxGMk2F4tbtY+t1yCn8EqO2oHq5r9GPiM+lNL45YidYJ1f5C/bq2q/pg8sEi
	AkRgFJ45ajilH1tQ7rHAWAhxN8CzQDyvhXHUNl0l2bgIYQepDuORmvD4p+zYIwv8GaRynUrPXYY3L
	xRHQMKbo4+LZ4oUSbdxLHFRatVb3FTf4Cejss5WVrm2FgKp2GphNGRcFh3mvMMzXzqFG2vL3chrvh
	2HqtBn6lnHIK91xKMLsFzqS0HYFwdlMxmhhp+jBf95ojdSBdo8i76Pufgqp1WxSlh28g+/nA0j6iB
	3WUNBXp1ubizPG//t2oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMdg-0000Y0-2Q; Tue, 28 Apr 2020 09:34:52 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMdc-0000Wa-72
 for linux-amlogic@lists.infradead.org; Tue, 28 Apr 2020 09:34:50 +0000
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de
 [79.239.197.167])
 by mail.holtmann.org (Postfix) with ESMTPSA id 49A3CCECEA;
 Tue, 28 Apr 2020 11:44:22 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 0/3] Bluetooth: hci_qca: add support for QCA9377
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200423013430.21399-1-christianshewitt@gmail.com>
Date: Tue, 28 Apr 2020 11:34:42 +0200
Message-Id: <07968FAA-BEC1-4E76-A529-0A004110F437@holtmann.org>
References: <20200423013430.21399-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_023448_400986_F1EB6D0A 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

> This series adds a new compatible for the QCA9377 BT device that is found
> in many Android TV box devices, makes minor changes to allow max-speed
> values for the device to be read from device-tree, and updates bindings
> to reflect those changes.
> 
> v2 changes: rebase against bluetooth-next
> 
> Christian Hewitt (3):
>  dt-bindings: net: bluetooth: Add device tree bindings for QCA9377
>  Bluetooth: hci_qca: add compatible for QCA9377
>  Bluetooth: hci_qca: allow max-speed to be set for QCA9377 devices
> 
> .../bindings/net/qualcomm-bluetooth.txt         |  5 +++++
> drivers/bluetooth/hci_qca.c                     | 17 ++++++++++-------
> 2 files changed, 15 insertions(+), 7 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
