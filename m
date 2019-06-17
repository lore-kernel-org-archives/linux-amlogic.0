Return-Path: <SRS0=61JF=UQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C26C31E5B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2019 19:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5292084B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2019 19:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsfuA3tT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PIzJmjz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5292084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8m+R/G6pE/d7wNAjfA4RO1MrNV1bGpUAGzgy8P0Rwwk=; b=UsfuA3tTqINCXg
	jGrKxRs5HwKxiXDrgJHs8uSazJAmyyutolEaAwgOXCQ5m8993BsSO/3qRp+JcCVbGDl9MVcDj8RtM
	oWvpH1pimKb3i8LdcnX2pTLuqpqMNZkDxNUsvgGps+VsP/GQtlQonFjDhmhkTMMzKbsi9PtFRa2Pj
	J93J6TULUJ7Ler2KRRVWf+fHp9ngLmqQa3vpUeWQg80Zhg5H0vzF7K8xfCJhl0hKbDChBVaKMWqdb
	BBcJVnDH7XPa/Zn1Z4aeE/lLKNhzbbqv3Xn6hgpkM5zb+ryE0pP6fEoPxa4M7qcsBG8geGGkPkTYq
	fZBEImhZtlZGDlI0Intw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcxQp-0001OL-LM; Mon, 17 Jun 2019 19:36:43 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcxQm-0001No-Sv
 for linux-amlogic@lists.infradead.org; Mon, 17 Jun 2019 19:36:42 +0000
Received: by mail-ot1-x342.google.com with SMTP id r21so7846743otq.6
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2019 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YICN94oE44IsHFiBZGliUzFUwGQppnVWb/4nM6D15Y4=;
 b=PIzJmjz+W5ihhuFf61Ku+INYYnm+XrPiBky0DbjYS9LFbBprs3yfiZkOFTTbg5G6DR
 Dc9asebFQhT7VN41P6PyR8UHm6zZh5gk9cD4+Rwt7p2HHBOL7z4Y1LuZi+wcEwxtRCLU
 ElX5nu3NYR+y1OK//V2ZOVlMN0FmXWLV5RtpDUIb7RmcsWLESB74qys8XuLcx8dJKO6W
 Bun5nZMBSDJPM/6OAOMxxf3JCwEKhAvHrFzlJNDIP2ySzRfSNJxyYh+qZhHRahqKvmuz
 uRTJLUhPxQVRX+QuZh25AaxZs2809kNKOOvOc2GiY/EFI6czNUwUCotkhe1oc8BjxE0j
 88zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YICN94oE44IsHFiBZGliUzFUwGQppnVWb/4nM6D15Y4=;
 b=qo//r+c/9qdm+g8C1YakmCWd8G84PHhdhY7AfdcwNxvdK/RnKoyhhk7nugfsetRNWO
 vnDaByXUJBKwA+v8z3wHURom43cACM9VgSgPA7I/eZMxLpm0J71rT8VD3XPG8D0IWt67
 sZZ2a/AqtWKkk82uxkKeQCUhjOVGNFLFA+DIOslU/tlFnj7MU/4y9EdmiLNOlt+qRyBu
 4sIAKBzipFztdT+ZfbqjQo7NvkFUXn2Aa7fDVAz3P9TXNUZsAtbxub6wW2KtjUfkcMkt
 GiV2hul3qUFyarcBUOqXuFMmgguqRP6eBs2/TeraZF+tBBhI0Jxchv4VBnEtN1+JDK83
 RPNQ==
X-Gm-Message-State: APjAAAXM6m8Yv0KRjNSCY7R/fDheXdKSgn5wJLPJaV5nxX/BgYvI8wkw
 7F+nD5QbK0Lb0F4JJFf0JH3u0HlIG1kFuKMXNep+lfBM
X-Google-Smtp-Source: APXvYqzgJHmcozy0eRV2r+LMrjpevx6loyv2Lyp+mDsdK1RJOxtEOo5Ze31Qh+QYwNpuYwLKo6SktX5sBzcoGMWodck=
X-Received: by 2002:a9d:14a:: with SMTP id 68mr38837631otu.96.1560800197867;
 Mon, 17 Jun 2019 12:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
 <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
 <c6684037-7d06-457e-2931-9e375128b2e7@aplu.fr>
 <CAFBinCDJ0oAhrficayP0aMWrUsasU-NT6RkGH3x1BLw8U3h6pA@mail.gmail.com>
 <22a14736-d363-f5a8-fdb3-fec5400cb6a8@aplu.fr>
In-Reply-To: <22a14736-d363-f5a8-fdb3-fec5400cb6a8@aplu.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 17 Jun 2019 21:36:26 +0200
Message-ID: <CAFBinCDLaz4GebHgVo6P6C9ZtL5LtihVczAyuaRN+mnXKhHuzw@mail.gmail.com>
Subject: Re: Meson8b network not stable at gigabit
To: Aymeric <mulx@aplu.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_123640_987247_36E165C1 
X-CRM114-Status: GOOD (  16.95  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQXltZXJpYywKCk9uIFN1biwgSnVuIDE2LCAyMDE5IGF0IDg6NTcgUE0gQXltZXJpYyA8bXVs
eEBhcGx1LmZyPiB3cm90ZToKPgo+IEhlbGxvIE1hcnRpbiwKPgo+IExlIDE2LzA2LzIwMTkgw6Ag
MTg6MzAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgYSDDqWNyaXQgOgo+ID4gT24gU3VuLCBKdW4gMTYs
IDIwMTkgYXQgNjowNSBQTSBBeW1lcmljIDxtdWx4QGFwbHUuZnI+IHdyb3RlOgo+ID4gWy4uLl0K
PiA+PiBUaGUgcmVzdWx0IGZyb20gL3Byb2MvaW50ZXJydXB0cyBhYm92ZSBhcmUgd2hlbiBJJ20g
Y29ubmVjdGVkIHRvIG15Cj4gPj4gb3BlcmF0b3IgYm94LCBmcm9tIHRoZSBkLWxpbmsgdGhlIHZh
bHVlIGRvZXNuJ3QgY2hhbmdlIGFueSBtb3JlLgo+ID4+Cj4gPj4gQWNjb3JkaW5nIHRvIHRoZSAi
YWJvdXQgcGFnZSIgb2YgdGhlIGludGVybmV0IGJveCwgdGhpcyBpcyBhIFNhZ2VtY29tCj4gPj4g
KExpdmVib3ggMykuCj4gPj4KPiA+PiBTbyBpdCBsb29rIGxpa2UgdGhlcmUgYSBpbmNvbXBhdGli
aWxpdHkgYmV0d2VlbiB0aGUgUmVhbHRlayBSVEw4MjExRiBhbmQKPiA+PiB0aGUgIlNhZ2VtY29t
IiBidXQgbm90IHdpdGggYSAic3R1cGlkIiBkLWxpbmsgc3dpdGNo4oCmLgo+ID4gY2FuIHlvdSB0
cnkgdG8gZGlzYWJsZSBFRUUgKGVuZXJneSBlZmZpY2llbnQgRXRoZXJuZXQpIGZvciBHYml0IGxp
bmtzPwo+ID4geW91IG5lZWQgdG8gcmVidWlsZCB0aGUgLmR0YiAodHlwaWNhbGx5IGJ1aWx0IHRv
Z2V0aGVyIHdpdGggdGhlCj4gPiBrZXJuZWwpIGZvciB0aGF0Ogo+ID4gLSBvcGVuIGFyY2gvYXJt
L2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzCj4gPiAtIGdvIHRvIHRoZSAiZXRoX3BoeSIg
bm9kZSAoZm9yIGV4YW1wbGU6IFswXSkKPiA+IC0gYmVsb3cgdGhlICJyZWcgPSA8MD47IiBsaW5l
IGFkZDogZWVlLWJyb2tlbi0xMDAwdDsKPiA+IC0gcmVidWlsZCB0aGUga2VybmVsIHRvIGdldCBh
biB1cGRhdGVkIC5kdGIKPiA+IC0gYm9vdCB0aGUga2VybmVsIHdpdGggdGhhdCAuZHRiCj4KPiBU
ZXN0IGRvbmUgb24gNS4yLjAtcmM0LCB0aGF0IGRpZG4ndCBjaGFuZ2UgYW55dGhpbmcgKEkndmUg
ZG91YmxlCj4gY2hlY2tlZCwgdGhpcyBpcyB0aGUgbmV3IC5kdGIgSSdtIHVzaW5nKS4KdG9vIGJh
ZCwgdGhhdCB3YXMgdGhlIG9ubHkgInNtYXJ0IiBpZGVhIEkgaGFkLgoKZGlkIHNlZSB0aGlzIGlz
c3VlIHdpdGgga2VybmVsIHZlcnNpb25zIGVhcmxpZXIgdGhhbiA1LjAgYXMgd2VsbD8KdGhlbiB5
b3UgY2FuIHRyeSB0byBnaXQgYmlzZWN0IHRoZSBjYXVzZQoKeW91IGNhbiBhbHNvIHNlbmQgYSBz
aW1pbGFyIG1haWwgdG8gdGhlIG5ldGRldiBtYWlsaW5nIGxpc3QgKHBsZWFzZQprZWVwIHRoZSBB
bW9naWMgbGlzdCBhdCBsZWFzdCBDYydlZCkgYW5kIGFzayBmb3IgaGVscCB0aGVyZQp0aGUgQW1s
b2dpYyBTb0NzIHVzZSBhIERlc2lnbldhcmUgTUFDIChFdGhlcm5ldCBjb250cm9sbGVyLCB0aGUg
ZHJpdmVyCmlzIGNhbGxlZCBzdG1tYWMpIHdpdGggYSBSZWxhdGVrIFJUTDgyMTFGIEV0aGVybmV0
IFBIWS4KdGhlcmUncyBsaXR0bGUgQW1sb2dpYyBzcGVjaWZpYyByZWdpc3RlcnMgaW52b2x2ZWQ6
IHRoZXkgbW9zdGx5CmNvbnRyb2wgdGhlIFBIWSBpbnRlcmZhY2UgKGVuYWJsaW5nIFJNSUkgb3Ig
UkdNSUkpIGFuZCB0aGUgY2xvY2tzCnNvIGl0J3MgdmVyeSBsaWtlbHkgdGhhdCBzb21lb25lIG9u
IHRoZSBuZXRkZXYgbGlzdCBoYXMgYW4gaWRlYSBob3cgdG8KZGVidWcgdGhpcyBiZWNhdXNlIGEg
bGFyZ2UgcGFydCBvZiB0aGUgRXRoZXJuZXQgc2V0dXAgaXMgbm90IEFtbG9naWMKU29DIHNwZWNp
ZmljCgoKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
