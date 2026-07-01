Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDF0C43602
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8yrZTUSEHBeBVVmMgky/jO3Q7dDFxvriGXefzDUDCg=; b=PZWc2FK3cf6FAg
	DdyGFLX3Q90xM77SZW73/JOGgSwgGqZ1Vk3ykSBjhlGNM75b0Eq3MAke1S8LfNsr3Ss1u7+GCxBDI
	ejul8A8WUAjIfAGuBViJWD/uqhhjHodKj1GRofb3t6unEHrZ/s8Q0/2BtkBXxL3G6e/u0PYje+2eo
	maE2X1a4dmDhu/+xTFkvz2u/DTTRuWl0dvKZepdnAemhq9dQUSWOiOUKrjvPyzGtk2smWcXa33Mua
	bWkEiUqxzPDvRFRD6AYM2U/6gA4AaHCJpKLbeEvOYgfarUrqUnORrfKzYomH+58xTr4Kpy4SzaRv1
	IC6rj2HGSbTzZeQlAkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoUI-00000000nxU-24K0;
	Wed, 01 Jul 2026 06:31:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoUH-00000000nxK-03Ne;
	Wed, 01 Jul 2026 06:31:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 496DF600AB;
	Wed,  1 Jul 2026 06:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99791F000E9;
	Wed,  1 Jul 2026 06:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782887516;
	bh=d3/fteDdeaDUb7HQHKSHZdGzJyvgRky/lNVy7Qw3Av0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n4goOVL30pVwfTB+AWexMrJnCGhUNnc5KRtLRnmVDICyJwmPlpIHlcQUFH6RFYeCU
	 YuFXnd0CV25QivbFTHhG7sjMrhOrrG5YaeknU3tty6U8UGAdODODaoMvzNcSaJrtau
	 c7V1Elg/qE76Hw6OSqhag+/DBxjFsyLywPZznuVKd3V7UM4FbpwJk2p4DnLyKq8Z+e
	 oMZH0r4YPLFPZAzNH+i9DjEXO0QHb76VdoYxkZujq9sgO6FIkBfVhMjSFg7Q6NdbDk
	 ZY1i+FaFVk/48vAgEdIVfEGCmeAcwVE6Y4oUJ53F4qlAN9l6C/JjOWOJ2FeKMtmve0
	 kXpjPHzauO8jQ==
Date: Wed, 1 Jul 2026 08:31:47 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: gowtham <gowtham@ferryfair.com>
Cc: yue.wang@amlogic.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PULL] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
Message-ID: <5rf4ijh4kagydji7n4nuieunqzbwgk3cg5i5n2srjf4npzrjth@dcqeafnmrs4q>
References: <20260614095626.7afb7c04@slick.ferryfair.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614095626.7afb7c04@slick.ferryfair.com>
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

T24gU3VuLCBKdW4gMTQsIDIwMjYgYXQgMDk6NTY6MjZBTSArMDUzMCwgZ293dGhhbSB3cm90ZToK
PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0Cj4gYmI1MzJiZmFmNzkxOWM3Yzk4
Y2FhYjgxODY0ZTljZTI2NDZlMTFlMzoKPiAKPiAgIExpbnV4IDcuMC4xMSAoMjAyNi0wNi0wMSAx
Nzo1NDo1NSArMDIwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKPiAKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9Hb3d0aGFtS3VkdXB1ZGkvbGludXguZ2l0Cj4g
ICB0YWdzL21lc29uLXBjaWUtd2FybS1yZXNldC1saW51eC03LjAueQo+IAo+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byA4NTI4MTFiMTE3OTVlZTM4OWVhNmE5NTNlZDBkYjY5Yjc2NzIy
NDY5Ogo+IAo+ICAgUENJOiBtZXNvbjogRml4IFBFUlNUIyB0aW1pbmcgYnkgYXNzZXJ0aW5nIHJl
c2V0IGJlZm9yZSBMVFNTTSBlbmFibGUKPiAgICgyMDI2LTA2LTE0IDA5OjQxOjAxICswNTMwKQo+
IAoKU29ycnksIHdlIGRvbid0IHB1bGwgcGF0Y2hlcyBmcm9tIHJhbmRvbSB0cmVlcy4gUGxlYXNl
IHN1Ym1pdCB0aGUgcGF0Y2hlcyB0bwpsaW51eC1wY2kgZm9yIHJldmlldy4KCi0gTWFuaQoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
