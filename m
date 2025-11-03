Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AC0CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Nov 2025 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZVEx/pKrtyx+p9lp0vIpXnHRsPk6WxJy1iwbsr7jwI=; b=pIj8Rh1gcNdlJE
	7aLrIw+K7F0UoAsY2ItO/swgVdolE6tcCAi2hyluH9ecOXj3FSLnf3nNBChbqoW+JYEyj4DXx9DQ7
	cFDrQ/DMbC1hCFNKL+iAfE1AfJz8+enTTqkcrXpPs0D+ZCwYq88LHzrDbCqWmUSDngUrW8XGx/soK
	uh/5eocF+JOBM+uqoHlipHoicTQUnHJ6xLtZs9vzylsiOYuZn4tTWVJ1Tw3wVJKOyIGzyiSGLmuhD
	aaE0UnKn+mJkYYluqKhZ2R0Kv75nC/zdnt5t5h3ZnDGQKYgbgpRsAv0ZM7KqeRiL5tsC7BqFqconU
	y5OOq8FWbIag8n1cmmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrai-00000009aSp-1T0c;
	Mon, 03 Nov 2025 10:15:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrah-00000009aSW-2Qf1;
	Mon, 03 Nov 2025 10:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5CAA60007;
	Mon,  3 Nov 2025 10:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECE3C4CEE7;
	Mon,  3 Nov 2025 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164910;
	bh=O4x0jqqxagDU/VftuFhDlptuntE9Kac7vSj33pi2VvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJ+MBqKfKXeU/teJKJ87gBmtT1H1BpXVfHwO16qP63B5LdGVaJSV+ZjQQmJu9RFK1
	 7ImrzDBiLUdYKyv/kEzjpwZWhzcEL+29oAWdzzer2uxPpLr5FWTEK2cHSVutB00P0j
	 aSCJu+fpbOQHw1up1SDyYXhspEpM/WX63O9IfCYozFIpoE1IcIICeg1nYpA24W2/C3
	 UP+l2hYftcqz7VhZfnGW1e+Pl+yoq752ZwpWFpQPfj8HSGTcwUuhCs9mpFd+DIxZbu
	 1JRpmWucJkIC7kZRS2gXoGxuCjhqFqvhT7jw6pFD119wN0z1NnpfqtAv7ec98zqTMW
	 LdKbA99Io3xLw==
Date: Mon, 3 Nov 2025 15:44:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, 
	Jingoo Han <jingoohan1@gmail.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org, 
	stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
Subject: Re: [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI region
Message-ID: <mwdy2qe2kp6ygwyw7ohjykzwcsi7udzitizmbzk2rfuf4jesnj@gbjmjfuvzkvw>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <83d07b54-d584-4297-9aae-2a170c0059d4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83d07b54-d584-4297-9aae-2a170c0059d4@linaro.org>
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

T24gTW9uLCBOb3YgMDMsIDIwMjUgYXQgMTA6NTA6MjBBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gT24gMTEvMS8yNSAwNToyOSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+
ID4gSGksCj4gPiAKPiA+IFRoaXMgY29tcGlsZSB0ZXN0ZWQgb25seSBzZXJpZXMgYWltcyB0byBm
aXggdGhlIERCSSBwYXJzaW5nIGlzc3VlIHJlcG9yZWQgaW4KPiA+IFsxXS4gVGhlIGlzc3VlIHN0
ZW1zIGZyb20gdGhlIGZhY3QgdGhhdCB0aGUgRFQgYW5kIGJpbmRpbmcgZGVzY3JpYmVkICdkYmkn
Cj4gPiByZWdpb24gYXMgJ2VsYmknIGZyb20gdGhlIHN0YXJ0Lgo+ID4gCj4gPiBOb3csIGJvdGgg
YmluZGluZyBhbmQgRFRzIGFyZSBmaXhlZCBhbmQgdGhlIGRyaXZlciBpcyByZXdvcmtlZCB0byB3
b3JrIHdpdGggYm90aAo+ID4gb2xkIGFuZCBuZXcgRFRzLgo+ID4gCj4gPiBOb3RlOiBUaGUgZHJp
dmVyIHBhdGNoIGlzIE9LIHRvIGJlIGJhY2twb3J0ZWQgdGlsbCA2LjIgd2hlcmUgdGhlIGNvbW1v
biByZXNvdXJjZQo+ID4gcGFyc2luZyBjb2RlIHdhcyBpbnRyb2R1Y2VkLiBCdXQgdGhlIERUUyBw
YXRjaCBzaG91bGQgbm90IGJlIGJhY2twb3J0ZWQuIEFuZCBJJ20KPiA+IG5vdCBzdXJlIGFib3V0
IHRoZSBiYWNrcG9ydGluZyBvZiB0aGUgYmluZGluZy4KPiA+IAo+ID4gUGxlYXNlIHRlc3QgdGhp
cyBzZXJpZXMgb24gdGhlIE1lc29uIGJvYXJkIHdpdGggb2xkIGFuZCBuZXcgRFRzLgo+IAo+IExl
dCBtZSB0cnkgdGhpcyBzZXJpZSwgSSdtIG9uIGEgYnVzaW5lc3MgdHJpcCB0aGlzIHdlZWsgc28g
ZG9uJ3QgZXhwZWN0IGEgZnVsbCB0ZXN0Cj4gcmVwb3J0IHVudGlsIG5leHQgbW9uZGF5Lgo+IAoK
U3VyZS4gSSBtYXkgcG9zdCB0aGUgbmV4dCBpdGVyYXRpb24sIGJ1dCB3aWxsIG5vdCBtZXJnZSB0
aGUgYmluZGluZy9kcml2ZXIKcGF0Y2hlcyB1bnRpbCB5b3UgY29uZmlybS4KCi0gTWFuaQoKPiBO
ZWlsCj4gCj4gPiAKPiA+IC0gTWFuaQo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcGNpL0RNNFBSMDVNQjEwMjcwN0I4Q0RGODRENzc2QzM5RjIyRjJDN0YwQUBETTRQ
UjA1TUIxMDI3MC5uYW1wcmQwNS5wcm9kLm91dGxvb2suY29tLwo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBvc3MucXVh
bGNvbW0uY29tPgo+ID4gLS0tCj4gPiBSZXNlbmRpbmcgYXMgdGhlIGdpdCBzZW5kZW1haWwgY29u
ZmlnIGdvdCBtZXNzZWQgdXAKPiA+IAo+ID4gLS0tCj4gPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
KDMpOgo+ID4gICAgICAgIGR0LWJpbmRpbmdzOiBQQ0k6IGFtbG9naWM6IEZpeCB0aGUgcmVnaXN0
ZXIgbmFtZSBvZiB0aGUgREJJIHJlZ2lvbgo+ID4gICAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6
IEZpeCB0aGUgcmVnaXN0ZXIgbmFtZSBvZiB0aGUgJ0RCSScgcmVnaW9uCj4gPiAgICAgICAgUENJ
OiBtZXNvbjogRml4IHBhcnNpbmcgdGhlIERCSSByZWdpc3RlciByZWdpb24KPiA+IAo+ID4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvYW1sb2dpYyxheGctcGNpZS55YW1sICAgICAgfCAg
NiArKystLS0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNp
ICAgICAgICAgICAgIHwgIDQgKystLQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZzEyLWNvbW1vbi5kdHNpICAgICAgfCAgMiArLQo+ID4gICBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyAgICAgICAgICAgICAgICAgfCAxOCArKysrKysrKysrKysr
KystLS0KPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMg
ICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0tCj4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPiAtLS0KPiA+IGJhc2UtY29tbWl0OiAzYTg2
NjA4Nzg4MzlmYWFkYjRmMWE2ZGQ3MmMzMTc5YzFkZjU2Nzg3Cj4gPiBjaGFuZ2UtaWQ6IDIwMjUx
MDMxLXBjaS1tZXNvbi1maXgtYzhiNjUxYmM2NjYyCj4gPiAKPiA+IEJlc3QgcmVnYXJkcywKPiAK
Ci0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+N
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
