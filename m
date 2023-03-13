Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F79C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5iA+MEMIukMvJlfvYnSZPYg0uR9g1rs5DgCHSJBNVQc=; b=ILTjhcVmCB/lq3
	eNhvVY14kScoe4oiX/Z8FEry91L79lXNUBLsn7XhKg4wNHghdYmGj3yxR96Nv4Baa38j2DCKPYoNA
	L2RQBViyDyviTzrB8vuCL0IiWjeCmmbdXEKgQSenzYNbU2f80F/lBWrfXDXu54AzNXdcXOD8ngoyD
	k28QIF2zvR9l+bnHZ8pRaJsu14HH1hgjk3TaCwhJzo+Np3AJ/HqpqX0h0XcPsi62nX4oR2oUuqV06
	y4xIJ3s+5q2GQCczQbLPV5VIaOWv2sEJzruJ3nz/cyMCyYYtKLYUoj2MHN30KlRL+dBhZ+qdPGHrG
	BFuhoFehicZmdriSMIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBYW-00BWSu-0c;
	Tue, 14 Mar 2023 20:47:36 +0000
Received: from [103.30.145.160] (helo=defaultworkshop.klidefectmanagement.com.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBYT-00BWSH-0m
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 20:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asda.co.uk;
	s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=RwMWHPCeT2+4CjGC5mN8xDAISawTQ8iKMcBe8TYdTOI=; b=f
	1EPYbuSYWEsxE45DxLDIVf6Q5zCVRYDW9Mstum+mmO0ev4LqlpL5fPtbEnd84Ugou3acTTveRouUi
	mT1miqHJZGvPVMOjXinQJys9Yya6/JFbcyvYJcuTi9sKdPqesjq5xVAFiK4IrE8OBrL/HG6X8GvAy
	qgM1KArCNBuPYf40=;
Received: from ec2-52-11-215-80.us-west-2.compute.amazonaws.com ([52.11.215.80] helo=asda.co.uk)
	by defaultworkshop.klidefectmanagement.com.novalocal with esmtpa (Exim 4.94.2)
	(envelope-from <sales1@asda.co.uk>)
	id 1pblsJ-0005L0-5B
	for linux-amlogic@lists.infradead.org; Tue, 14 Mar 2023 00:22:21 +0700
From: ASDA Stores Limited <sales1@asda.co.uk>
To: linux-amlogic@lists.infradead.org
Subject: First quarter procurement order/enquiry
Date: 13 Mar 2023 17:22:18 +0000
Message-ID: <20230313152049.6A3C3D44578FD24B@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_134733_310304_3CC9019F 
X-CRM114-Status: UNSURE (  -0.89  )
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
Reply-To: sales@asda-c.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear linux-amlogic
I'm a procurement manager  with ASDA Group (the owners of ASDA 
Stores) and your company product has caught our interest. 
Therefore, we request you send
list and prices of your hot selling items (products) for our 
evaluation/pick.

Soon as we receive your reply, we shall send you our company 
profile and buying proposal. You can also check our website below 
for detailed info of our purchase area and trading capacity.

Your immediate response E-mail:  sales@asda-c.com   shall be 
appreciated.

Best Wishes

Ms Stelle Montgomery
Purchasing Dept.
ASDA Stores Limited
Tel:  +44 7418367220
WhatsApp: + 44-7502985874
Website: www.asda.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
