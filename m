Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07761C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 May 2022 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jrYnuus4Oe8zwLNrbN5YIKcmtGuLAnF47rRb/d0Ov9I=; b=fep8xiCLp1JGzW
	qL/e+6He7LXFxQdqhu0/xDzzKb15fNNrsyzFBKMo07fWaziW78tYN43vAX1AX1a9s1hnb3SJGlcVR
	a4OM9WZbJZSfFTEF4y6oFlRFKNx2rDFJpTZhMc6BZPazPPg+UC0Fo9pyEjgUsV+0bRDR7YFDWhvyg
	RC1EJvv1aEqU2pNLjL1SuDJFQzfRnhDCj4Q8jNiaJxPK4bLcJ3NrCUfap1FYzq30o0oxsvqXFrLtM
	6EWy2hC7eiNnwqSln+H7SdJ7Hsi6SH+KFq3yaS/KxaeAGts5TorqokiJ2s1nFpRBEEkMmbjcVMZTS
	ZwI/vQO9hRce6c1SNw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltpi-006K5p-Dd; Tue, 03 May 2022 14:48:58 +0000
Received: from mail.megasoftsol.com ([43.231.250.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltpe-006K2t-Do
 for linux-amlogic@lists.infradead.org; Tue, 03 May 2022 14:48:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id 3BD3890E9BB
 for <linux-amlogic@lists.infradead.org>; Tue,  3 May 2022 20:16:22 +0530 (IST)
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8EElwe3Ns6NY for <linux-amlogic@lists.infradead.org>;
 Tue,  3 May 2022 20:16:21 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id AA9DB90E9B3
 for <linux-amlogic@lists.infradead.org>; Tue,  3 May 2022 20:16:21 +0530 (IST)
X-Virus-Scanned: amavisd-new at megasoftsol.com
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id w1YXPa5GUyu1 for <linux-amlogic@lists.infradead.org>;
 Tue,  3 May 2022 20:16:21 +0530 (IST)
Received: from asda.co.uk (unknown [20.97.211.134])
 (Authenticated sender: admin)
 by mail.megasoftsol.com (Postfix) with ESMTPSA id DC67090E9B7
 for <linux-amlogic@lists.infradead.org>; Tue,  3 May 2022 20:16:20 +0530 (IST)
From: ASDA Stores Limited <Hanes.Thomas23877@asda.co.uk>
To: linux-amlogic@lists.infradead.org
Subject: 2nd Quater puchase request
Date: 03 May 2022 14:48:47 +0000
Message-ID: <20220503092157.6047B6BEF04424A9@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_074854_808398_659CCD1D 
X-CRM114-Status: UNSURE (  -0.57  )
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
Reply-To: sales@asdaa.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RGVhciBsaW51eC1hbWxvZ2ljCgpXZSBhcmUgaW50ZXJlc3RlZCBpbiBoYXZpbmcgc29tZSBvZiB5
b3VyIGhvdCBzZWxsaW5nIHByb2R1Y3QgaW4gCm91ciBzdG9yZXMgYW5kIG91dGxldHMgc3ByZWFk
IGFsbCBvdmVyIFVuaXRlZCBLaW5nZG9tLCBOb3J0aGVybiAKSXNsYW5kIGFuZCBBZnJpY2EuIEFT
REEgU3RvcmVzIExpbWl0ZWQgaXMgb25lIG9mIHRoZSBoaWdoZXN0LQpyYW5raW5nIFdob2xlc2Fs
ZSAmIFJldGFpbCBvdXRsZXRzIGluIHRoZSBVbml0ZWQgS2luZ2RvbS4gCiAgCldlIHNoYWxsIGZ1
cm5pc2ggb3VyIGRldGFpbGVkIGNvbXBhbnkgcHJvZmlsZSBpbiBvdXIgbmV4dCAKY29ycmVzcG9u
ZGVudC4gSG93ZXZlciwgaXQgd291bGQgYmUgYXBwcmVjaWF0ZWQgaWYgeW91IGNhbiBzZW5kIAp1
cyB5b3VyIGNhdGFsb2cgdGhyb3VnaCBlbWFpbCB0byBsZWFybiBtb3JlIGFib3V0IHlvdXIgY29t
cGFueSdzIApwcm9kdWN0cyBhbmQgd2hvbGVzYWxlIHF1b3RlLiBJdCBpcyBob3BlZnVsIHRoYXQg
d2UgY2FuIHN0YXJ0IGEgCnZpYWJsZSBsb25nLWxhc3RpbmcgYnVzaW5lc3MgcmVsYXRpb25zaGlw
IChwYXJ0bmVyc2hpcCkgd2l0aCB5b3UuICAKICAKICAKWW91ciBwcm9tcHQgcmVzcG9uc2Ugd291
bGQgYmUgZGVsaWdodGZ1bGx5IGFwcHJlY2lhdGVkLiAKICAKQmVzdCBXaXNoZXMgCiAgCiAgCkhh
bmVzIFMuIFRob21hcyAKUHJvY3VyZW1lbnQgT2ZmaWNlLiAKQVNEQSBTdG9yZXMgTGltaXRlZCAK
VGVsOiAgKyA0NCAtIDc0NTEyNzE2NTAgCldoYXRzQXBwOiArIDQ0IOKAkyA3NDQxNDQwMzYwIApX
ZWJzaXRlOiB3d3cuYXNkYS5jby51awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
