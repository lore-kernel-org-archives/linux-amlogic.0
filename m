Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78876C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 May 2022 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n9vKVtS2DuM+4n+WsMClg2lrzgfgEQmWFgtmd4tPnvc=; b=uaKvybpdKY2Pey
	zdUVPQif+5GvHmJU/VG/cfdjYzLDVZPkkn6xDhNpNSX7SYKozWQ5/w8nEMCEqC9tEPBIOr8omYTFa
	FARPfIgahtFYIZ+Z2OL0bm+3UzdubrChUuYxiXkSXAn4ayraxnt9BWFjHLRD+0lG6MQlNBJQ24RDS
	z/RtYRBPz9TVgUSEABIllgSOf6gFFt63EeraJr7zskaMA3jqcylFLZdfx6uscljXx+QORCvF3pCfJ
	JVqC4cRT2hmJNG+ROvTkN4RGWR+vIKxrPz2tgf9R9m+pTT9pkfwVk6fSmmhVB//f9iGY5bmQbu2bM
	J4UvdfiNOqhoaXTQis/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqzPK-00ElHo-M9; Tue, 17 May 2022 15:46:46 +0000
Received: from mail.neweas.com ([162.19.155.127])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqzPH-00ElGb-DU
 for linux-amlogic@lists.infradead.org; Tue, 17 May 2022 15:46:44 +0000
Received: by mail.neweas.com (Postfix, from userid 1002)
 id 636A022C99; Tue, 17 May 2022 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neweas.com; s=mail;
 t=1652802396; bh=qQhd+6rcOH+OhrNQ6A9OWLCE/79cwvyTtb6LUe1aYuU=;
 h=Date:From:To:Subject:From;
 b=WHuwwcMZ2vj60Snp7/vffewFA2eMS60ai17KHaZK5M15BiB6oOPm2S55eWgRlQ/69
 +JGmTP/aaCtgI/+7HGdiy4vEV09yaK9VoCySwEreTIGuHhMxpwfYHN/HvTtnJ86E6L
 WvinFckGhjPW+FrOfb+f3LbcgyOwVMn84J0/n7ZOzdNJXgSSY+puWTWv2dsmuKf667
 lopqs1jAy25skZAU4fE9wMZ+JNIHJLiTtalybpO2NmunaJUnu8LxzuU5nn8LKEtkAn
 TAEWMrey5zUydd0pJUIgq6mubn/KVC5pVi/uuBS9elJIxw5VlvCEtvEx1Q2UwYGmCG
 9jv9wgkm6+yZw==
Received: by mail.neweas.com for <linux-amlogic@lists.infradead.org>;
 Tue, 17 May 2022 15:45:46 GMT
Message-ID: <20220517141500-0.1.f.101j.0.a2f14z48ji@neweas.com>
Date: Tue, 17 May 2022 15:45:46 GMT
From: "Luca Gauthier" <luca.gauthier@neweas.com>
To: <linux-amlogic@lists.infradead.org>
Subject: New collaboration
X-Mailer: mail.neweas.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_084643_729169_4E20B793 
X-CRM114-Status: UNSURE (  -0.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgphcmUgeW91IGxvb2tpbmcgZm9yIG1vcmUgYnVzaW5lc3MgY2xpZW50cz8KCldlIHdv
dWxkIGxpa2UgdG8gc3RhcnQgd29ya2luZyB3aXRoIHlvdSBhcyBhIHBhcnRuZXIgaW4gYWNxdWly
aW5nIG9yIGV4Y2hhbmdpbmcgbGVhZHMsIHdoaWNoIGRpcmVjdGx5IHRyYW5zbGF0ZXMgaW50byBt
dXR1YWwgYmVuZWZpdHMgaW4gdGhlIGZvcm0gb2YgYW4gaW5jcmVhc2VkIGNsaWVudCBwb3J0Zm9s
aW8uCgpXZSB3b3JrIGluIHRoZSBzZWN0b3Igb2YgaW50ZXJuZXQgbWFya2V0aW5nIGFuZCBhcyBv
bmUgb2YgdGhlIGZpcnN0IGluIEV1cm9wZSBTRU8gQWdlbmNpZXMgd2XigJl2ZSBpbnRyb2R1Y2Vk
IHRoZSBTRU8gMzYwIHNlcnZpY2Ugd2hpY2ggYWxsb3dzIHlvdXIgY2xpZW50cyB0byBnYWluIHRo
ZSBhY2Nlc3MgdG8gb3JpZ2luYWwgU0VPIGNvbnN1bHRhdGlvbnMuCgpCeSBjaG9vc2luZyB0byB3
b3JrIHdpdGggdXMgeW91IHJlY2VpdmUgc3VwcG9ydCBpbiBhY2hpZXZpbmcgeW91ciBidXNpbmVz
cyBnb2FscywgYW5kIGhlbHAgaW4gaGFuZGxpbmcgRGlnaXRhbCBNYXJrZXRpbmcgZm9yIHlvdXIg
Y2xpZW50cy4KCldlIHN1cHBvcnQgb3ZlciAyMzcgcGFydG5lciBjb21wYW5pZXMuIFdlIGhhdmUg
b25lIG9mIHRoZSBiaWdnZXN0IGV4ZWN1dGl2ZSBkZXBhcnRtZW50cyBpbiBFdXJvcGUgYXQgb3Vy
IGRpc3Bvc2FsLCB3ZeKAmXZlIHByZXBhcmVkIG92ZXIgMjAwMCBjYW1wYWlnbnMgaW4gRXVyb3Bl
IGFuZCAyMDAgaW4gdGhlIFVTQSBhbmQgQ2FuYWRhLgoKQXJlIHlvdSBpbnRlcmVzdGVkIGluIHRo
ZSBkZXRhaWxzIG9mIG91ciBwYXJ0bmVyc2hpcCBwcm9ncmFtbWU/CgpZb3VycyBzaW5jZXJlbHks
Ckx1Y2EgR2F1dGhpZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
