Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F590C6FD19
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAxpM3jgZjRMO5bguxVGOJYE74bUeVJsdKs1cJ/gqS0=; b=TtFD3FrTN9uqD8
	le1K+ghue7lol0wncWsVppcHIJbV/aGhz/fKMW+J9AevWNxa+wqxX3CwjbuNoAGvI2717W2O7QP78
	HYBTCb/mm/cD2yanCUrfFW0kp7g5u1N7kF+iUULG0QbuufcySvWHCw1QVwUQ8vCfqL6l0LWc2q/4J
	fr27KxHBC/dbzWoL1fKOmNZz7uya6ZBxGvL07+3N14RqDBfyq/zMAtmLo3XFpctl8WM2ar1u+WP2W
	cYdrixG2y4YFDMDwFsmt4u6BvumpSTrkphcFyTeUOj9VrhryldVoTxBJEKzUB+Jh1de2hsaC8pRQR
	Zu2hE9OaMOuAj6NqkjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcpvF-00Guf7-08;
	Thu, 16 Mar 2023 15:53:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcpvC-00GueH-12;
	Thu, 16 Mar 2023 15:53:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EAE41B81F9A;
	Thu, 16 Mar 2023 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAA5C433D2;
	Thu, 16 Mar 2023 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678982019;
	bh=Rj/V4HvM4lftSD7pR5Qhs+36gJgM/NfzJd5glSkQr/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIGG2QuV9M6wru4NUwa7EWkLGPBulz674i9mA5XOCE2CmTJ9uGsMePf+3NiFEKUof
	 GKxNtKYUhHmtHzmLkjHnv2cFxHtSOyaHSM/HpxF3HfVYU6l1ZgceT4hRjDKcc1cMZX
	 VCt70267hChSrXRbxqOvPKi75pPEcf2y1rgwCHZ81OIucGW56DqAL5zqMMF9OfQ3KP
	 Be8pEZHxzFjGeq/heU9OwWJJhqPFEuMh3dyn9CcIs6tYLXnDe3bvp8hz4TX+t3R8JI
	 nPmnIoub6qTFr45Q49rvmk/mypxAack4lCR7Fw4oAeJP2eDAoqN/MqPfX2plt/R0K8
	 Upu0a5Emv/UMA==
Date: Thu, 16 Mar 2023 15:53:33 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] mfd: Use of_property_present() for testing DT property
 presence
Message-ID: <20230316155333.GL9667@google.com>
References: <20230310144712.1543379-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230310144712.1543379-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_085342_505037_7B89B058 
X-CRM114-Status: GOOD (  13.31  )
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

T24gRnJpLCAxMCBNYXIgMjAyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEl0IGlzIHByZWZlcnJl
ZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+IG9mX3Byb3Bl
cnR5X3JlYWRfPHR5cGU+IGZ1bmN0aW9ucykgcmF0aGVyIHRoYW4gbG93LWxldmVsCj4gb2ZfZ2V0
X3Byb3BlcnR5L29mX2ZpbmRfcHJvcGVydHkgZnVuY3Rpb25zIGZvciByZWFkaW5nIHByb3BlcnRp
ZXMuIEFzCj4gcGFydCBvZiB0aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9maW5kX3By
b3BlcnR5IGNhbGxzIHRvIHRoZQo+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3BlcnR5X3ByZXNlbnQo
KSBoZWxwZXIgd2hlbiB3ZSBqdXN0IHdhbnQgdG8gdGVzdAo+IGZvciBwcmVzZW5jZSBvZiBhIHBy
b3BlcnR5IGFuZCBub3RoaW5nIG1vcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9iY20yODM1LXBtLmMgfCAyICst
Cj4gIGRyaXZlcnMvbWZkL2toYWRhcy1tY3UuYyB8IDIgKy0KPiAgZHJpdmVycy9tZmQvc3RtcGUu
YyAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcwoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
