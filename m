Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02344CC6B33
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Dvkl74U8ljV1Isg3c4m86UNZkoeq577aAdSm7rlEnc=; b=w2bV715SxwM5b3
	sTAkdSoIVoeJ9n0RdReoHMybZUADNsU1PPL7UHxixqurg04N3LTzEcMnYTsEYWCGHraVOQGsRJvrG
	7bZ05IKJ4I+I94nIsjlU/UIwBjs/4FeCDhs2VpOtMEC/D0h+9skfskyYqrbYH0wok57Yj+Erju2ui
	ig2Kokr1T4+2sjksQ7+bv9G/bWT05xV9e7aCQBC0j8s5w1LF9u4N8VpVw8l0E7fIv8p9PHvZoztKU
	WkOhj/ZCiaxlEosRGXZ/kU3n6jT+gFVsKYXf4yhPQ+lyUP73vF+CZMorV01526NNULbOWaz0Xqxwp
	BVxzD5iFDeng/4k+ZGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKlZ-000000008ts-174P;
	Thu, 15 Oct 2026 12:41:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKlX-000000008te-1fgG
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Oct 2026 12:40:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8302860120;
	Thu, 15 Oct 2026 12:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93161F000C4;
	Thu, 15 Oct 2026 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068058;
	bh=8mr44ruIlIuHraNgUPoKCSk1dsomii5Qenj5BOx/kFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RYRTWz+mK492CPkvVk5HhwblexUlTQ+xI+DnYLJPL2am88N9UoACtYXvwGy5Y4zvR
	 sX0zzB6cJ4ljq+xfwjxgbBjCPRCTH6xOISQQNe5HjTbYyz6M3TrSe7Lo3i35csCRLo
	 qCERGuwFe9L8dR1FaRv35uSIp/GDgIZSlZkhHhJG2W2oKiGnrZfr8amzifvNtoLgrz
	 LaJOiDanz56oiYFrdjTBln6ZtsSV32mMNd0DkC+Q45BpFAQEJeCs2MaG5btkmLTsHh
	 P5Yg0Fit7U0SpzWIm1NdhbuJXeI4pV85yPdgLIMhh7JvyqNURrugntOQd02rl/k8mI
	 cmFiU31kNNiJQ==
Message-ID: <sashiko-outbox-172832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 2/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-2-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-2-0266c2ead980@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:40:57 +0000
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IG5l
dDogbWlzc2VkIHBvd2VyLWRvbWFpbnMgY29uc3RyYWludCBpbiB1bHRyYXJpc2MsZHAxMDAwLWdt
YWMueWFtbAotLQoKY29tbWl0IGVhZjc2M2IwZDBkMzA5NzU3YzZjZjdmOWZlMDY3MTU1ZWI5OWVi
MTEKQXV0aG9yOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+CgpkdC1iaW5k
aW5nczogbmV0OiBxY29tOiBkb2N1bWVudCB0aGUgZXRocW9zIGRldmljZSBmb3IgU0NNSS1iYXNl
ZCBzeXN0ZW1zCgpUaGlzIGNvbW1pdCBkZXNjcmliZXMgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFy
aWFudCBvZiB0aGUgUUNvbSBEZXNpZ25XYXJlIE1BQwppbiBhIHNlcGFyYXRlIGZpbGUuIEl0IHVw
ZGF0ZXMgdGhlIHRvcC1sZXZlbCBzbnBzLGR3bWFjLnlhbWwgdG8gYWxsb3cgdXAgdG8KdHdvIHBv
d2VyIGRvbWFpbnMgYW5kIHJlc3RyaWN0cyBleGlzdGluZyByZWZlcmVuY2luZyBiaW5kaW5ncyB0
byBhIG1heGltdW0gb2YKb25lIHBvd2VyIGRvbWFpbi4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiBpbmRleCAyMjE4
YTQ5MjgxN2ZkLi4yYzQ4NDI0MDRiZjY3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKClsgLi4uIF0KCj4gQEAg
LTE4Nyw3ICsxODgsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgLSBlbnVtOiBbYWhiLCBz
dG1tYWNldGgtb2NwXQo+ICAKPiAgICBwb3dlci1kb21haW5zOgo+IC0gICAgbWF4SXRlbXM6IDEK
PiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBtYXhJdGVtczogMgo+ICAKPiAgICBtYWMtbW9kZToK
PiAgICAgICRyZWY6IGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbCMvcHJvcGVydGllcy9waHktY29u
bmVjdGlvbi10eXBlCgpbU2V2ZXJpdHk6IExvd10KV2FzIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvdWx0cmFyaXNjLGRwMTAwMC1nbWFjLnlhbWwgbWlzc2VkIGluCnRoZSB1
cGRhdGVzIHRvIG90aGVyIGJpbmRpbmdzPwoKVGhlIGNvbW1pdCBtZXNzYWdlIHN0YXRlcyB0aGUg
aW50ZW50IHRvIHVwZGF0ZSBleGlzdGluZyBiaW5kaW5ncyByZWZlcmVuY2luZwpzbnBzLGR3bWFj
LnlhbWwgdG8gbGltaXQgdGhlaXIgbWF4SXRlbXMgZm9yIHBvd2VyLWRvbWFpbnMgdG8gMS4gSG93
ZXZlciwKdWx0cmFyaXNjLGRwMTAwMC1nbWFjLnlhbWwgcmVmZXJlbmNlcyBzbnBzLGR3bWFjLnlh
bWwgdW5kZXIgaXRzIGFsbE9mIG5vZGU6CgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L3VsdHJhcmlzYyxkcDEwMDAtZ21hYy55YW1sOgphbGxPZjoKICAtICRyZWY6IHNucHMs
ZHdtYWMueWFtbCMKCkJlY2F1c2UgdGhlIHRvcC1sZXZlbCBzbnBzLGR3bWFjLnlhbWwgd2FzIHJl
bGF4ZWQgdG8gYWxsb3cgMiBwb3dlciBkb21haW5zCmhlcmUsIGFuZCB1bHRyYXJpc2MsZHAxMDAw
LWdtYWMueWFtbCBsYWNrcyBhIGxvY2FsIG92ZXJyaWRlLCBkb2VzIGl0IGltcGxpY2l0bHkKaW5o
ZXJpdCB0aGUgbmV3bHkgcmVsYXhlZCBsaW1pdCBvZiAyPwoKQ291bGQgdGhpcyBjYXVzZSBhIHNj
aGVtYSB2YWxpZGF0aW9uIHJlZ3Jlc3Npb24gd2hlcmUgZGV2aWNlIHRyZWVzIGZvciB0aGUKaGFy
ZHdhcmUgY291bGQgaW5jb3JyZWN0bHkgc3BlY2lmeSB1cCB0byB0d28gcG93ZXIgZG9tYWlucyB3
aXRob3V0IGZhaWxpbmcKdmFsaWRhdGlvbj8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMTQtcWNvbS1zYTgyNTVwLWVtYWMtdjE2
LTAtMDI2NmMyZWFkOTgwQG9zcy5xdWFsY29tbS5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
