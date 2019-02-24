Return-Path: <SRS0=HZJY=Q7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C93EC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Feb 2019 19:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A883520663
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Feb 2019 19:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWTxaUQx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="OOoHpTXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A883520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dr1yJQji/pgz++hd1jkKk0z/BSUWBm2y54kA3ES/vvw=; b=hWTxaUQxjcbjISFnrQ8SCgAVJ
	RAJ7xkzV20i2BI7nSOMOMWLSJxpkrntG5JpYnSfikmBzuG1sIL9a6GTidh4HjqYHytUD7V7tbgq8B
	XDNJTHjsEPLmftynO84nX4COxLoUbkCwRKoPLC6AaiAVxnhP5V0sKgUujINt9i68Xbj+/SGUjbvDq
	bi+3+5AZWDw9ceqyLgpw4h313a8JFLBrVN/lyLLD/gqQo0dNjxgT1Ku/bGXef6PC2BPL8Xb4qAx83
	iRl1cLhj0tbPVAWIWq78GJanyx7fUlOukk81o/OEyOjEF7inf32+iPKGCw2krr10KmCtIUuv9qtaS
	iJbZhN33A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxzgG-0006jg-Fj; Sun, 24 Feb 2019 19:43:20 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxzgC-0006jH-2l
 for linux-amlogic@lists.infradead.org; Sun, 24 Feb 2019 19:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=QDA72ArM6gVN//oxoyNeK8WIs/uRQVbqnezySqi1eYk=; 
 b=OOoHpTXvI6YsAzxVYM/CfapQj+mvofaHFp4jpkEJXyTGBd1iYSCvuAon+LPlLjusBy5F3Mpvr3AqbtK6cfgULIu73IjrhScINWLdKBbl+hRKjfuJNQYq3jeO3YZMQeqkqv2U+EEG5B+IpOcUP9gIqHHCvidZmZo8YO2txinDUtU=;
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
Date: Sun, 24 Feb 2019 20:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
X-Received: from [2003:c9:3f14:9100:2860:99bb:f60c:84c5]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1gxzg9-0002Gb-7n; Sun, 24 Feb 2019 20:43:13 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_114316_453378_E40128EC 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gKioKPgo+ICoqaXRzIGNsZWFybHkgdmlzaWJsZSB3aGVuIGkgYWN0aXZhdGVkIHRoZSBvdGhl
ciBzdHJlYW0gZm9yIGdldHRpbmcKPiBkdXBsZXggbG9hZCAuLi4gVGhlIGhpZ2hlc3QgcmF0ZSBh
bHNvIHN0YXlzIGFsb3QgdW5kZXIgdGhlIHBvc3NpYmxlCj4gOTMwTUJpdHMgdGhhdCBpIGhhdmUg
c2VlbiBlYXJsaWVyIHdpdGggNC4xNC4KPiAqKgo+Cj4gKioKPiAqKgo+Cj4gKip0aGUgcGFyYWxs
ZWwgc3RyZWFtIHJlYWNoZWQgYXJvdW5kIDQ1ME1iaXRzICwgd2hpY2ggYWxtb3N0IHN1bXMgdXAg
dG8KPiA2NjBNYml0cy4gVGhpcyBpcyB3aGF0IGkgbWVhbnQgd2hlbiBpIHNhaWQgdGhhdCBkdXBs
ZXggbWlnaHQgYmUgYnJva2VuLgo+ICoqCj4KPiAqKgo+ICoqCj4KPiAqKkNvbm5lY3RpbmcgdG8g
aG9zdCAxMC4xMC4xMS4xMDAsIHBvcnQgNTIwMQo+IFvCoCA1XSBsb2NhbCAxMC4xMC4xMS4xIHBv
cnQgMzg2NTggY29ubmVjdGVkIHRvIDEwLjEwLjExLjEwMCBwb3J0IDUyMDEKPiBbIElEXSBJbnRl
cnZhbMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRyYW5zZmVywqDCoMKgwqAgQml0cmF0ZcKgwqDCoMKg
wqDCoMKgwqAgUmV0csKgIEN3bmQKPiBbwqAgNV3CoMKgIDAuMDAtMS4wMMKgwqAgc2VjwqAgNjIu
OSBNQnl0ZXPCoMKgIDUyOCBNYml0cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMKPiBbwqAg
NV3CoMKgIDEuMDAtMi4wMMKgwqAgc2VjwqAgNTYuOSBNQnl0ZXPCoMKgIDQ3NyBNYml0cy9zZWPC
oMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMKPiBbwqAgNV3CoMKgIDIuMDAtMy4wMMKgwqAgc2VjwqAg
NTUuOSBNQnl0ZXPCoMKgIDQ2OSBNYml0cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMKPiBb
wqAgNV3CoMKgIDMuMDAtNC4wMMKgwqAgc2VjwqAgNTMuMCBNQnl0ZXPCoMKgIDQ0NSBNYml0cy9z
ZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMKPiBbwqAgNV3CoMKgIDQuMDAtNS4wMMKgwqAgc2Vj
wqAgNTQuMyBNQnl0ZXPCoMKgIDQ1NSBNYml0cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMK
PiBbwqAgNV3CoMKgIDUuMDAtNi4wMMKgwqAgc2VjwqAgNTQuOCBNQnl0ZXPCoMKgIDQ2MCBNYml0
cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMKPiBbwqAgNV3CoMKgIDYuMDAtNy4wMMKgwqAg
c2VjwqAgNDUuMyBNQnl0ZXPCoMKgIDM4MCBNYml0cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0
ZXMKPiBbwqAgNV3CoMKgIDcuMDAtOC4wMMKgwqAgc2VjwqAgNTEuMiBNQnl0ZXPCoMKgIDQyOSBN
Yml0cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBLQnl0ZXMKPiBbwqAgNV3CoMKgIDguMDAtOS4wMMKg
wqAgc2VjwqAgNTYuMSBNQnl0ZXPCoMKgIDQ3MCBNYml0cy9zZWPCoMKgwqAgMMKgwqAgNjUuNiBL
Qnl0ZXMKPiBbwqAgNV3CoMKgIDkuMDAtMTAuMDDCoCBzZWPCoCA1NS4zIE1CeXRlc8KgwqAgNDY0
IE1iaXRzL3NlY8KgwqDCoCAwwqDCoCA2NS42IEtCeXRlcwo+IC0gLSAtIC0gLSAtIC0gLSAtIC0g
LSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0KPiBbIElEXSBJbnRlcnZhbMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFRyYW5zZmVywqDCoMKgwqAgQml0cmF0ZcKgwqDCoMKgwqDCoMKgwqAgUmV0cgo+
IFvCoCA1XcKgwqAgMC4wMC0xMC4wMMKgIHNlY8KgwqAgNTQ2IE1CeXRlc8KgwqAgNDU4IE1iaXRz
L3NlY8KgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbmRlcgo+IFvCoCA1XcKgwqAg
MC4wMC0xMC4wMMKgIHNlY8KgwqAgNTQ1IE1CeXRlc8KgwqAgNDU3IE1iaXRzL3NlYwo+IHJlY2Vp
dmVyKioKPgo+ICoqCj4gKioKPgo+ICoqcmVnYXJkcywqKgo+Cj4gKipTaW1vbgo+ICoqCj4KPiAq
Kgo+ICoqCndoaWNoIHN0bWFjIGRldmljZSBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/IGl0cyBub3Qg
eW91ciB3aW5kb3dzIHBjLiBpZiAKaXRzIGEgaXBxODA2NCBiYXNlZCBkZXZpY2Ugb3Igc29tZXRo
aW5nIGxpa2UgdGhhdCB5b3Ugc2hvdWxkIGxvb2sKb24gYSB2ZXJ5IGRpZmZlcmVudCBsb2NhdGlv
bi4gdGhpcyBwbGF0Zm9ybSBsaWtlIHRoZSByNzgwMCBoYXMgc3RtYWMgCnBlcmZvcm1hbmNlIHBy
b2JsZW1zIHNpbmNlIHRoZSBrZXJuZWwgY2xrIGNvZGUgZm9yIHRoaXMgZGV2aWNlIGlzIGxldHMg
CnNheSAidmVyeSB3cm9uZyIuCnNvIGFsb3Qgb2YgY2xvY2tzIGFyZW50IGNvcnJlY3QgYW5kIHNv
IHRoZSBldGhlcm5ldCBwZXJmb3JtYW5jZSB3aWxsIApzdWZmZXIuCgppIGNhbiB0ZWxsIHlvdSB0
aGF0IGknbSBhYmxlIHRvIGdldCA5MzAgbWJpdCBvbiBhIHN0bW1hYyBiYXNlZCBkZXZpY2UuIApi
dXQgYXMgaSBzYWlkLiB0aGUga2VybmVsIG5lZWRzIG90aGVyIG51bWVyb3VzIGZpeGVzIHRvIGdl
dCBhIGdvb2QgCnBlcmZvcm1hbmNlCgpyb290QFRFVzgyNzp+IyBpcGVyZjMgLWMgMTAuODguMTkz
LjEzNCAtaSAxCkNvbm5lY3RpbmcgdG8gaG9zdCAxMC44OC4xOTMuMTM0LCBwb3J0IDUyMDEKW8Kg
IDVdIGxvY2FsIDEwLjg4LjE5My45MCBwb3J0IDM2MDI0IGNvbm5lY3RlZCB0byAxMC44OC4xOTMu
MTM0IHBvcnQgNTIwMQpbIElEXSBJbnRlcnZhbMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRyYW5zZmVy
wqDCoMKgwqAgQml0cmF0ZcKgwqDCoMKgwqDCoMKgwqAgUmV0csKgIEN3bmQKW8KgIDVdwqDCoCAw
LjAwLTEuMDDCoMKgIHNlY8KgwqAgMTA4IE1CeXRlc8KgwqAgOTAzIE1iaXRzL3NlY8KgwqDCoCAw
wqDCoCA1LjE3IE1CeXRlcwpbwqAgNV3CoMKgIDEuMDAtMi4wMMKgwqAgc2VjwqDCoCAxMTIgTUJ5
dGVzwqDCoCA5NDMgTWJpdHMvc2VjwqDCoMKgIDDCoMKgIDUuMTcgTUJ5dGVzClvCoCA1XcKgwqAg
Mi4wMC0zLjAwwqDCoCBzZWPCoMKgIDEwOSBNQnl0ZXPCoMKgIDkxMyBNYml0cy9zZWPCoMKgwqAg
MMKgwqAgNi4wMiBNQnl0ZXMKW8KgIDVdwqDCoCAzLjAwLTQuMDDCoMKgIHNlY8KgwqAgMTEyIE1C
eXRlc8KgwqAgOTQ0IE1iaXRzL3NlY8KgwqDCoCAwwqDCoCA2LjAyIE1CeXRlcwpbwqAgNV3CoMKg
IDQuMDAtNS4wMMKgwqAgc2VjwqDCoCAxMDkgTUJ5dGVzwqDCoCA5MTAgTWJpdHMvc2VjwqDCoMKg
IDHCoMKgIDYuMDIgTUJ5dGVzClvCoCA1XcKgwqAgNS4wMC02LjAwwqDCoCBzZWPCoMKgIDExMSBN
Qnl0ZXPCoMKgIDkzNSBNYml0cy9zZWPCoMKgwqAgMMKgwqAgNi4wMiBNQnl0ZXMKW8KgIDVdwqDC
oCA2LjAwLTcuMDDCoMKgIHNlY8KgwqAgMTA5IE1CeXRlc8KgwqAgOTEyIE1iaXRzL3NlY8KgwqDC
oCAxwqDCoCA2LjAyIE1CeXRlcwpeQ1vCoCA1XcKgwqAgNy4wMC03LjUxwqDCoCBzZWPCoCA1Ni4y
IE1CeXRlc8KgwqAgOTM1IE1iaXRzL3NlY8KgwqDCoCAwwqDCoCA2LjAyIE1CeXRlcwoKPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
