Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E70AC5DF85
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 19:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMU54X8Fg4aiumgBKYxvRAb2OHuNF9eUcBbuYW3T88o=; b=lc55/hN7DGUL2+
	fprN5UX1dDMs0yzzdcEWJwrXJzjbLinwAW62SSmUkzJVTqr2tz+M2Tjjr3Cd20OFiWiZ2Z65wRzZy
	mJZADMYwDZb7+DaoK+t62gcQxy8OYmbjpHLe4XUVzl2zkqtnFTRtIHupIztyNQwc5cC/X79EQrnh4
	251P+B3j3hLvIeYXl/YdSGROWtfqjj274gHRz8PKx5YjOk7+coiJsy3EUerBHS6V5oF44S27eapzS
	uzn/6iByITvSkwSmOYfQS8vIuWYDZ2k1+d4id6HJvbCWwQMA0TN45T5AfOxL/wPo3gJ31xIDAFknJ
	p436ntQE/3aqZB2Ul4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlho-0000000AQxM-0hAG;
	Wed, 19 Aug 2026 19:12:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlhn-0000000AQx8-0MfO
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 19:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5147960DC0;
	Wed, 19 Aug 2026 19:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F201F000E9;
	Wed, 19 Aug 2026 19:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166726;
	bh=9TgllrluCeYu/YAyEp+bbwM4z721z1J3oqvcCNmbno8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnAFG3Q8gnBWrOVlbnvfWskJ2x3+R22O2ZmAac4ynGOGROH3heWJ3g8iSGh0rwKmG
	 G3tRZeKKXiU9KAAPv441aX591NJxL6KzWLmqoR9ljcQbPivlVtH5lbiR+aVd4tmTvo
	 aFXr26clmuXxbyHW6746WXf6tm8e617P50NmYD0D/mPH72C2ULCOEQVKhYP5O6vWjZ
	 P01NcKRQM0uWJnOG9yygIaOykD4/v8EBLIdO54V61dtp79xY5TwNmDj2orJAoUTJli
	 hFx+QukYIfRTZAt2P97p/gtYFEwQN/gzNFA11RVsfhH1Q9NJRe/JRboIYqGpblHc6A
	 moHoLCu/+fZkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data
 is fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
Date: Wed, 19 Aug 2026 19:12:05 +0000
Message-Id: <20260819191205.D0F201F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBUaGUgY2xrX2luaXRfZGF0YSBzdHJ1Y3R1cmUgY29udGFpbnMgc2V2ZXJhbCBtdXR1YWxseS1l
eGNsdXNpdmUgbWVtYmVycwo+IGZvciBkaWZmZXJlbnQgbWV0aG9kcyB0byBzcGVjaWZ5IHRoZSBw
b3NzaWJsZSBwYXJlbnRzIG9mIGEgY2xvY2ssCj4gcHJvbXB0aW5nIGRyaXZlcnMgdG8gaW5pdGlh
bGl6ZSBvbmx5IHRoZSBtZW1iZXJzIHRoZXkgbmVlZC4gIEhvd2V2ZXIsCj4gbm90IGluaXRpYWxp
emluZyBhbGwgbWVtYmVycyBtYXkgY2F1c2Ugc3VidGxlIGlzc3Vlcywgd2hpY2ggYXJlIG9ubHkK
PiBleHBvc2VkIHdoZW4gQ09ORklHX0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk4gb3IgQ09ORklHX0lO
SVRfU1RBQ0tfTk9ORSBpcwo+IGVuYWJsZWQuCj4gCj4gbHRjNDI4X2Nsa19wcm92aWRlcl9zZXR1
cCgpIGRvZXMgbm90IGZpbGwgaW4gYW55IHBhcmVudCBjbG9ja3MsIGFuZAo+IGFzc3VtZXMgdGhh
dCBpbml0Lm51bV9wYXJlbnRzIGlzIE5VTEwuICBIb3dldmVyLCB0aGUgbGF0dGVyIGluCj4gdW5p
bml0aWFsaXplZCwgYW5kIHRodXMgbWF5IGNhdXNlIGEgY3Jhc2guCj4gCj4gTWFrZSBzdXJlIGFs
bCBtZW1iZXJzIGFyZSBmdWxseSBpbml0aWFsaXplZCwgdG8gZml4IHN1Y2ggYnVncywgYW5kIHRv
Cj4gYXZvaWQgZnV0dXJlIGJyZWFrYWdlIHdoZW4gY29udmVydGluZyBkcml2ZXJzIHRvIGEgZGlm
ZmVyZW50IG1ldGhvZCBmb3IKPiBzcGVjaWZ5aW5nIHRoZSBwYXJlbnRzLgo+IAo+IEZpeGVzOiBj
YmMyOTUzOGRiZjdkNzQwICgiaHdtb246IEFkZCBkcml2ZXIgZm9yIExUQzQyODIiKQo+IFNpZ25l
ZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpT
YXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxv
b2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC9jb3Zlci4xNzg3MTY1MzI5LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZT9w
YXJ0PTMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
