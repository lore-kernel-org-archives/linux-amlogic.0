Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2B7C64EC7
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE9Jb/+UQYtDw4BpteLwj3VjlT6kvrh4a7hjvLMBUP8=; b=h0qiioexrjlnN9
	MNd1DGn7ZiiXdV6wzbsMnlWso0FeTvI2gjfaWo6UyAdfHQKIlAg5ovg17S4CE4pc78I+4EelyRept
	hC8fWv89lDEX2bfBa6b5CWepK4nUPHgRn7J9TFZxKjocLfgu+MlEdUae2xJgdtm5MwoFReS/zBIN1
	mLBDIGaeJtHm/1Dy+2H6ZdM/tGhCSjrnx+1LUCIWp52nOZZMXo8FqXb53+m2CN4E4WKzOYYRAuxnV
	GBrjUU+8+fS6B/Ae3VZEeQhrMjCG4eqhgcA7K5vFC7412qPT1nayZsALrmBRsQWutrxqKbdq/r0RF
	Z+v/4W1tRcyHElU/FJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXH23-00FKmS-LZ; Wed, 01 Mar 2023 07:37:47 +0000
Received: from m12.mail.163.com ([220.181.12.199])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXH1z-00FKjt-28; Wed, 01 Mar 2023 07:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=gPxuCXELldzNi98FN7X8dXWChn2cRowf1KkZQnzgp5w=;
	b=HTLHnBGfoR3nG9IpjNnK7jEqCI92vaOfIextzSbCgcJl55gUenZUeeS4osjwMG
	LPd5A8scU9CkaS+RSK64K32BTAZiMKgizvADqhU4LeSYYwlL2nGatBTQB6erh6jb
	JnHa9XhDyMuky+WCFxz6vwveUDQebzhJkl9OFRTVkXlik=
Received: from [10.88.37.184] (unknown [61.185.214.195])
	by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wCnBEqaAP9jCAOABg--.16695S2;
	Wed, 01 Mar 2023 15:37:00 +0800 (CST)
Message-ID: <a0d7a363-a693-d114-c28a-2290dfa0f89f@163.com>
Date: Wed, 1 Mar 2023 15:36:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Conflict between video-lut and pmu on meson-g12
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: AML <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Chris Healy <healych@amazon.com>,
 Will Deacon <will@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Pierre-Hugues Husson <phh@phh.me>, jiucheng.xu@amlogic.com
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
 <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
From: Jiucheng Xu <jiuchengxu@163.com>
In-Reply-To: <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
X-CM-TRANSID: _____wCnBEqaAP9jCAOABg--.16695S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1kZFWDWr4UKr1xXw1xGrg_yoW8Zr1UpF
	W3Kr90yFWDJF1jv3Wjg3sFva4jgan3KFW5Wr98WwnrAay5uFyqvr1fKw1FvF97CrnYyrWI
	vF4jgry8ua4UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-txfUUUUU=
X-Originating-IP: [61.185.214.195]
X-CM-SenderInfo: pmlxuxxhqj53i6rwjhhfrp/1tbiRRwl4mDuy2dzwwABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_233744_012363_927D9445 
X-CRM114-Status: GOOD (  18.95  )
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

KyBqaXVjaGVuZ3h1QDE2My5jb20KCkFtbG9naWMgbWFpbCBzZW5kaW5nIHNlcnZlciBoYXMgcHJv
YmxlbS4gQWRkIG15IHBlcnNvbmFsIGVtYWlsLgpDb21tZW50cyBpbmxpbmUuCgpPbiAyMDIzLzMv
MSA1OjQ5LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+
Cj4gSGVsbG8gSml1Y2hlbmcgWHUsCj4KPiBPbiBUdWUsIEZlYiAyOCwgMjAyMyBhdCAxMDowNOKA
r1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4+IEEgc2ltcGxlIHNvbHV0aW9uIG1pZ2h0IGJlIHRvIHNw
ZWNpZnkgdGhlICJhY3R1YWwiIGJhc2Ugb2YKPj4+IHRoZSByZWdpc3RlciBzZXQsIGFuZCBjb3Vu
dCBmcm9tIDAgaW4gdGhlIGRyaXZlcj8KPj4gSSB0aGluayB5b3VyIGZpeCBpcyBjb3JyZWN0IChm
b3JtYWxseSBpdCB3b3VsZCBuZWVkIHRvIGJlIHNwbGl0IGludG8gYQo+PiBkcml2ZXIgYW5kIGEg
LmR0c2kgcGF0Y2ggLSBidXQgbGV0J3MgZG8gdGhpbmdzIHN0ZXAgYnkgc3RlcCkuCj4gV2hpbGUg
dGhpbmtpbmcgbW9yZSBhYm91dCB0aGlzIC0gSSB0aGluayB0aGUgd2hvbGUgLmR0c2kgY29kZSBz
aG91bGQKPiBiZSBpbXByb3ZlZC4gQm90aCBvZiB0aGUgUE1VIElPIHJlZ2lvbnMgYXJlIHBhcnQg
b2YgdGhlICZkbWMgcmVnaW9uLgo+IFNvIEkgdGhpbmsgJnBtdSBzaG91bGQgYmUgbW92ZWQgaW5z
aWRlICZkbWMgKHdpdGggdGhlIG9mZnNldHMgYWRqdXN0ZWQKPiBhY2NvcmRpbmdseSBvZiBjb3Vy
c2UpLgpPa2F5IEkgYWdyZWUgd2l0aCB5b3UuSSB3aWxsIHB1dCAmcG11IG5vZGUgaW50byAmZG1j
IG5vZGUuCj4KPiBBbHNvIEkgdGhpbmsgdGhlIGR0LWJpbmRpbmdzIGFyZSBpbmNvbXBsZXRlOiBh
Y2NvcmRpbmcgdG8gdGhlIGRyaXZlcgo+IGNvZGUgd2UncmUgdXNpbmcgWFRBTCBhcyBpbnB1dCBj
bG9jay4KPiBCdXQgdGhpcyBpcyBub3QgZGVzY3JpYmVkIGFueXdoZXJlIGluIHRoZSBkdC1iaW5k
aW5ncy4KPiBkdC1iaW5kaW5ncyBzaG91bGQgYWx3YXlzIGRlc2NyaWJlIHRoZSBoYXJkd2FyZS4g
VGhlIGRyaXZlciBjYW4gZGVjaWRlCj4gbm90IHRvIHVzZSBpdCBidXQgdGhlIGJpbmRpbmdzIG11
c3QgYWx3YXlzIGJlIGNvbXBsZXRlLgpTb3JyeSwgSSBjb3VsZG4ndCBnZXQgeW91ciBwb2ludC4g
SSBkaWRuJ3Qga25vdyB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4KWFRBTCBhbmQgRE1DLiBXb3Vs
ZCB5b3UgcGxlYXNlIHNoYXJlIG1vcmUgdGhlIGluZm9ybWF0aW9uPwo+IEFuZCB3aXRoIHRoaXMg
Y29tZXMgdGhlIHF1ZXN0aW9uOiBpcyB0aGUgRE1DIFBMTCBzcGVjaWZpYyB0byB0aGUgUE1VCj4g
b3IgaXMgaXQgc2hhcmVkIHdpdGggc29tZXRoaW5nIGVsc2UgKGUuZy4gdGhlIGFjdHVhbCBtZW1v
cnkKPiBjb250cm9sbGVyKT8gT24gdGhlIDMyLWJpdCBTb0NzIChNZXNvbjhiL1M4MDUgZm9yIGV4
YW1wbGUpIHRoZXJlJ3MgYQo+IHdob2xlIEREUiBjbG9jayBjb250cm9sbGVyICh1c2VkIGJ5IHRo
ZSBERFIgbWVtb3J5IGNvbnRyb2xsZXIpLCBzbyBJJ20KPiB3b25kZXJpbmcgaWYgdGhlc2UgbmV3
ZXIgU29DcyBhcmUgc3RpbGwgZm9sbG93aW5nIHRoYXQgYXBwcm9hY2guClllcywgdGhlIFBMTCBp
cyB0aGUgYmFzZSBpbnB1dCBjbG9jayBvZiBETUMgYW5kIFBNVSBpbnNpZGUuIEkgaGF2ZSBuZXZl
cgpzZWVuIHRoZSBtZXNvbjhiIGJvYXJkLiBJIHRoaW5rIEcxMiBpcyBhIG5ld2VyIGdlbmVyYXRp
b24gd2hpY2ggaGFzIHNvbWUgCmltcHJvdmVtZW50IHRoYW4gb2xkClNvQ3MuCgpNeSBFbmdsaXNo
IGlzIG5vdCB3ZWxsLiBNYXliZSBJIGRvZXNuJ3QgYW5zd2VyIHlvdXIgcG9pbnQgc2luY2UgSSBn
b3QgCm1pc3MtdW5kZXJzdGFuZGluZy4KClRoYW5rcyAmIEJlc3QgcmVnYXJkcwpKaXVjaGVuZwo+
Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
