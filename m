Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Dec 2021 06:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uilE3gszeLWOiPc0P4RtcPS3pUyD7dma+4cIgq2IKAc=; b=1HrxOefQsJzrZXlcP7uKS0oxc+
	NZJRw8tb53t7m3OXWheay0lrWbns6UUfjGl8KtkLLEuNtexQ3aCKCUiKG4XJZjdeZvOHx2prIqZhB
	V+T01v9Agg3feorJY3WjQ3gAO2wa2rxNoxvBbtA+3mBAJNI/26Kub5Vt9qxWUHpS7BAjb4GPyuRk/
	+GoAGR4N9T58mJDB/miQuW42lcFJCQ9UQIKhXiTGY2RGlxH85R+wWPUe0MgYXvxwbKsMzqaWQbnhQ
	wJvG/NgdNbTXzZq/KKZO7ggoRj8EwvgOcsG/8SS3a/EOb+tFI6tm7B2BMjbBCuYOm6hBV8cN4CDDM
	ODeb/5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvZOR-000s78-R7; Fri, 10 Dec 2021 06:28:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvZOF-000s5R-7K; Fri, 10 Dec 2021 06:28:20 +0000
Received: from [10.98.21.175] (10.98.21.175) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 10 Dec
 2021 14:28:03 +0800
Subject: Re: [PATCH] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
To: Neil Armstrong <narmstrong@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Christian Hewitt
 <christianshewitt@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Vyacheslav
 Bocharov <adeep@lexina.in>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
References: <20211208093347.4837-1-xianwei.zhao@amlogic.com>
 <bd981d0c-af5c-2b29-0ae3-df6bf01ea485@baylibre.com>
 <357b657c-161e-9977-976f-387165aa4883@baylibre.com>
From: xianwei.zhao <xianwei.zhao@amlogic.com>
Message-ID: <f1f15872-4f20-47c4-f745-a0ffe12f2f84@amlogic.com>
Date: Fri, 10 Dec 2021 14:28:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <357b657c-161e-9977-976f-387165aa4883@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.98.21.175]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_222819_285553_E7554A79 
X-CRM114-Status: GOOD (  11.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCgoKCiAgSSB3aWxsIG1vZGlmeSB0aGUgbGluZSBhbmQgdXBkYXRlIHRoZSBwYXRj
aCBsYXRlci4KCgoKClRoYW5rcyEKCgoKCkJlc3QgcmVnYXJkcywKCgoKCnhpYW53ZWkuemhhbwoK
CgpPbiAyMDIxLzEyLzkg5LiL5Y2IOTo1OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gCj4gT24g
MDkvMTIvMjAyMSAxNDo1NSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+ICtjYyBsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4+Cj4+IE9uIDA4LzEyLzIwMjEgMTA6MzMsIHhpYW53ZWkuemhhbyB3cm90ZToKPj4+IEFk
ZCBiaW5kaW5ncyBmb3IgdGhlIG5ldyBBbWxvZ2ljIFM0IFNvQyBmYW1pbHksCj4+PiBhbmQgdGhl
IGNvbXBhdGlibGUgZm9yIHRoZSBBbWxvZ2ljIFM0IEJhc2VkIEFRMjIyIGJvYXJkLgo+IAo+IFdo
YXQncyB0aGUgU29DIGNvbW1lcmNpYWwgbmFtZSA/IHM4MDV4MiA/IGFuZCB0aGUgYm9hcmQgbW9k
ZWwgPyBBUTIyMiBhbmQgdGhlIGZhbWlseSA/IFM0ID8KPiAKPj4+Cj4+PiBTNCBpcyBhbiBhcHBs
aWNhdGlvbiBwcm9jZXNzb3IgZGVzaWduZWQgZm9yIGh5YnJpZCBPVFQvSVAgU2V0IFRvCj4+PiBC
b3goU1RCKSBhbmQgaGlnaC1lbmQgbWVkaWEgYm94IGFwcGxpY2F0aW9ucywgd2l0aCBxdWFkIGNv
cmUgQ29ydGV4LUEzNS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiB4aWFud2VpLnpoYW8gPHhpYW53
ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDYgKysrKysrCj4+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4gaW5kZXggMzYwODE3MzRmNzIwLi42
MzAzN2ViZGQ3YmYgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPj4+IEBAIC0xODMsNiArMTgzLDEyIEBAIHByb3Bl
cnRpZXM6Cj4+PiAgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLGFkNDAxCj4+PiAgICAgICAgICAg
ICAtIGNvbnN0OiBhbWxvZ2ljLGExCj4+PiAgIAo+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEJv
YXJkcyB3aXRoIHRoZSBBbWxvZ2ljIE1lc29uIFM0IEFRMjIyIFNvQwo+IAo+IFNvIGl0IHNob3Vs
ZCBiZToKPiAgICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRzIHdpdGggdGhlIEFtbG9naWMgTWVz
b24gUzQgUzgwNVgyIFNvQwo+IAo+Pj4gKyAgICAgICAgaXRlbXM6Cj4+PiArICAgICAgICAgIC0g
ZW51bToKPj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxhcTIyMgo+Pj4gKyAgICAgICAgICAt
IGNvbnN0OiBhbWxvZ2ljLHM0Cj4+PiArCj4+PiAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVl
Cj4+PiAgIAo+Pj4gICAuLi4KPj4+Cj4+PiBiYXNlLWNvbW1pdDogYTNlYmRjYzhmYjNkOTRkZTM5
MGU1OGFkM2RhNjE2MTgyNmE1OGE4Nwo+Pj4KPj4KPiAKPiBOZWlsCj4gCj4gLgo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
