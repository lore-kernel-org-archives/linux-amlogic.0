Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D916CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Sep 2025 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5tVCAcnaVN75TEykCCPngt7t6vBwFUaZtov/WxV6N0=; b=g6UIV/fdjS4Hr3
	25NQqtA8RGjsXS/rPaq9dTH0BULs1rPzHHSG+zZlO0p+koJIQ9fkReyEkB1TCaBQh8rZ8KQEdaw5U
	HYSjBK6GDcID7bTAYwF1iDBmoZ73QUG/TU6MVABa68BSNybvV8uvnPxB8DxRHdCLxrzxmmwgQ+6vb
	7Q2fYbYVd04uPiLOc4qZqY9RaV0yehJ5BsNlzTy7sGhmxQtK5lKBkKXnxnlrYRTUI51pF4SpllbSX
	a7D0nx9c9O8/sqJVxNOP67K4ZvCHS04UOH3DteKEMgt4L5DKGhz5LdC6vYf1hPmHXm5TIuPKVUSbh
	ZFp+4S/ZSizfEblarsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3D7H-00000002Ts7-0liQ;
	Mon, 29 Sep 2025 12:36:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3D7D-00000002TrM-2vMQ
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Sep 2025 12:36:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so13166645e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Sep 2025 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759149386; x=1759754186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=;
        b=J28mLzcQbd+aD0s7VfEfCc5RLrDX4JzXrcWxH17iQfuJv0gcjSnnFPgfP0WwdTAptt
         Rj+mrSwfcdVwiSYMQY6/uxbb3U4HIKZpl1wX4tqwj7ptxTrduXljA2Pi8DejV+0MdWUs
         Jde0I4eqI2JjETGWWAFXy6367fSWaFlkveDcysQgkqB3U6LBnEqFLd1OMkbr6i10lq07
         7TBysiA1+eZUQK90cfNS8clDl2KVCuLwzjxBRuy+osH8DBjlbVUvO5GA2+f/cxJmEG+W
         TKsPMGDKjRpm0jWYWurYlsgF6iJKXqep6G4zzMDl8OwdTVuOZxCDIBlWq8gt8ENf3drr
         46DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759149386; x=1759754186;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5TiAseZcVQOtO3WU44wqIk3ETdplagD04sSEDVxBRM=;
        b=c6y0FtaddmwECFditrgEK5HYQ09vN7Iij/oImTUGMZysBL7D4EVBa1KSAO+XTF7uTe
         Zcem7pY6xjnrElRPswE6nysdvLSZzT+wVLbDQ6NeapCDPZHpE4dX5ysnewAhVo9paTUg
         W+r5pnn/R1VI5WD7J839KjGLRRbEwEaciuT6s7tghqI7QVLRsLbfvhXMlswPNqnonsHe
         TncWcVGC+tl9/pBAj3e6RsehmNiGggd2gR27r295xV3DtzJw510kM2/BKnCVIVmGvPv4
         Lx/Z/C/JuaRi9uEJT8rgRk+OlbUuXRjXH3iqPvLvQkfntJlym+vrliT3pSB14iwUpAyp
         VJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCW+yltyadH0TRRmYor/roV6T686/KgRL9XzTwcePRVinnt9aBWNlam8fHK/Qir6pLQaJNv/CT3kug8dSBK+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5PYdWllLLbiXaI2FoYZMwaPibXoy3Vnxl4BNy9HiOWG63PZtt
	NMC3xlJK+BOR71H82ZD3511iJDHU3QMF+ZGmHso0/ioGLyqZS9ynKaKh+bXYXMCoCgg=
X-Gm-Gg: ASbGncvabbxAfXphVFsApFl6gUo5HwgVyepftjTiNHvrisbrDGm4I1EJrHgTLQBCH7n
	fi7ZZca/opAfNbNJWp3qmHI5f3/vPwG8YdqH+Ve23SolGiIysScavF2nURRaxalViK9AiSst0at
	ZHqttHbMBsUxpR4vR3Jm8DJcWo0NgBDDjegvIVFuZd+y+ar26Ccml1J0g/sqFeEcHMyvOrGnqxN
	lICIf2zjOGG1a2inunLtU8yw+yccRH9KZJo420DvJROaQeB/vkcCMh6QbrFryUCqwoV8l8H6oqa
	wylRjfLIJycnCw8RpVYwvpm0D+F7SRyaDP+YEifaDNvABKE2pLcY1MfNoVZ0EDFHh2tqGkFkY6z
	WNUSxHFrP48CwVtX4MRDJJR5BhMenazg=
X-Google-Smtp-Source: AGHT+IHo0QKRizwsJhQ5D0tkdyBpVp2YHvhvxBq16FZ5DocejNzdXKBFoyHjJt0irT3wdJx8Oxn2bA==
X-Received: by 2002:a05:600c:4453:b0:46d:cfc9:1d20 with SMTP id 5b1f17b1804b1-46e329fa931mr124081375e9.22.1759149385782;
        Mon, 29 Sep 2025 05:36:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9ad:4617:2761:d4d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a9af27dsm229660415e9.8.2025.09.29.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 05:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com> (Chuan Liu's
	message of "Mon, 29 Sep 2025 11:15:46 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	<eee93d9d-2977-449d-8792-b2416f0c09ad@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 14:36:24 +0200
Message-ID: <1ja52d5tbr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_053628_004617_01946993 
X-CRM114-Status: GOOD (  33.59  )
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

T24gTW9uIDI5IFNlcCAyMDI1IGF0IDExOjE1LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IEhpIE1hcnRpbjoKPgo+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGV4
cGxhbmF0aW9uLgo+Cj4KPiBPbiA5LzI5LzIwMjUgNDo1NSBBTSwgTWFydGluIEJsdW1lbnN0aW5n
bCB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IEhlbGxvLAo+Pgo+PiBPbiBTdW4s
IFNlcCAyOCwgMjAyNSBhdCA4OjQx4oCvQU0gQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5j
b20+IHdyb3RlOgo+Pj4KPj4+IE9uIDkvMjgvMjAyNSAyOjA1IFBNLCBDaHVhbiBMaXUgd3JvdGU6
Cj4+Pj4gSGkgSmVyb21lICYgTWFydGluOgo+Pj4+Cj4+Pj4gU29ycnkgZm9yIHRoZSBpbXByZWNp
c2UgZGVzY3JpcHRpb24gb2YgdGhlIGdsaXRjaC1mcmVlIG11eCBlYXJsaWVyLgo+Pj4+Cj4+Pj4g
UmVjZW50bHksIHdoaWxlIHRyb3VibGVzaG9vdGluZyBhIENQVSBoYW5nIGlzc3VlIGNhdXNlZCBi
eSBnbGl0Y2hlcywKPj4+PiBJIHJlYWxpemVkIHRoZXJlIHdhcyBhIGRpc2NyZXBhbmN5IGZyb20g
b3VyIHByZXZpb3VzIHVuZGVyc3RhbmRpbmcsCj4+Pj4gc28gSSdkIGxpa2UgdG8gY2xhcmlmeSBp
dCBoZXJlLgo+PiBbLi4uXQo+Pj4gQW4gZXhhbXBsZSBvZiB0aGUgY2xvY2sgd2F2ZWZvcm0gaXMg
c2hvd24gYmVsb3c6Cj4+Pgo+Pj4KPj4+ICAgICAgICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAg
IF9fICAgIF9fICAgIF9fICAgIF9fCj4+PiBvcmk6ICDihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/i
hpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRCj4+PiAgICAgICAgICAg
ICAgICAgICAgIF4KPj4+ICAgICAgICAgICAgICAgICAgICAgMSAqIGN5Y2xlIG9yaWdpbmFsIGNo
YW5uZWwuCj4+PiAgICAgICAgICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBf
ICAgXyAgIF8KPj4+IG5ldzogIOKGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KG
kSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkSB8X+KGkQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA1ICogY3ljbGVzIG5ldyBjaGFubmVsLgo+Pj4gICAgICAgICAgX18gICAg
X18gICAgICAgICAgICAgICAgICAgICAgICBfICAgXyAgIF8gICBfCj4+PiBvdXQ6ICDihpEgIHxf
X+KGkSAgfF9fX19fX19fX19fX19fX19fX19fX1/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEK
Pj4+ICAgICAgICAgICAgICAgIF4gICAgICAgICAgICAgICAgICAgICAgICBeCj4+PiAgICAgICAg
ICAgICAgICBzdGFydCBzd2l0Y2hpbmcgbXV4LiAgICAgc3dpdGNoIHRvIG5ldyBjaGFubmVsLgo+
PiBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCByZXBvcnQhCj4+IFRoaXMgaXMgaW5kZWVkIHBy
b2JsZW1hdGljIGJlaGF2aW9yLiBJIGd1ZXNzIHRoZSByZXN1bHQgaXMgc29tZXdoYXQKPj4gcmFu
ZG9tOiBkZXBlbmRpbmcgb24gbG9hZCAocG93ZXIgZHJhdyksIHNpbGljb24gbG90dGVyeSAocXVh
bGl0eSksCj4+IHRlbXBlcmF0dXJlLCB2b2x0YWdlIHN1cHBseSwgLi4uIC0gb25lIG1heSBvciBt
YXkgbm90IHNlZSBjcmFzaGVzCj4+IGNhdXNlZCBieSB0aGlzLgo+Cj4KPiBZZXMsIG91ciBnbGl0
Y2gtZnJlZSBtdXggaXMgZGVzaWduZWQgdG8gcHJldmVudCBnbGl0Y2hlcyBjYXVzZWQgYnkKPiBl
eGNlc3NpdmVseSBzaG9ydCBoaWdoIG9yIGxvdyBsZXZlbHMgaW4gdGhlIGNsb2NrIG91dHB1dC4K
Pgo+Cj4+Cj4+IEJhc2VkIG9uIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIG9uIHRoaXMgdG9waWMs
IG15IHN1Z2dlc3Rpb24gaXMgdG8KPj4gc3BsaXQgdGhlIG9yaWdpbmFsIHBhdGNoOgo+PiAtIG9u
ZSB0byBhZGQgQ0xLX1NFVF9SQVRFX0dBVEUgd2hlcmUgbmVlZGVkIChJIHRoaW5rIHRoZSBtZXNv
bjhiLmMKPj4gZHJpdmVyIGFscmVhZHkgaGFzIHRoaXMgd2hlcmUgbmVlZGVkKSB0byBhY3R1YWxs
eSBlbmFibGUgdGhlCj4+IGdsaXRjaC1mcmVlIG11eCBiZWhhdmlvcgo+PiAtIGFub3RoZXIgb25l
IHdpdGggdGhlIENMS19PUFNfUEFSRU5UX0VOQUJMRSBjaGFuZ2UgKG1lc29uOGIuYyB3b3VsZAo+
PiBhbHNvIG5lZWQgdG8gYmUgdXBkYXRlZCkgdG8gcHJldmVudCB0aGUgZ2xpdGNoLWZyZWUgbXV4
IGZyb20KPj4gdGVtcG9yYXJpbHkgb3V0cHV0dGluZyBhbiBlbGVjdHJpY2FsIGxvdyBzaWduYWwu
IEplcm9tZSBhbHNvIGFza2VkIHRvCj4+IGRvY3VtZW50IHRoZSBiZWhhdmlvciBzbyB3ZSBkb24n
dCBmb3JnZXQgd2h5IHdlIHNldCB0aGlzIGZsYWcKPj4KPj4gQm90aCBwYXRjaGVzIHNob3VsZCBn
ZXQgdGhlIHByb3BlciAiRml4ZXMiIHRhZ3MuCj4+IEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBn
cmVhdCBpZiB5b3UgY291bGQgaW5jbHVkZSB0aGUgd2F2ZWZvcm0KPj4gZXhhbXBsZSBpbiBhdCBs
ZWFzdCB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgaXQgaGVscHMgdW5kZXJzdGFuZCB0aGUKPj4gcHJv
YmxlbS4KPj4KPj4gTGV0J3MgYWxzbyBnaXZlIEplcm9tZSBzb21lIHRpbWUgdG8gY29tbWVudCBi
ZWZvcmUgeW91IHNlbmQgcGF0Y2hlcy4KPgo+Cj4gQSBWMiB2ZXJzaW9uIHdhcyBzdWJtaXR0ZWQg
bGF0ZXIgd2l0aCBjaGFuZ2VzIGJhc2VkIG9uIHlvdXIgc3VnZ2VzdGlvbnMuCj4gUmVnYXJkaW5n
IHRoZSAiRml4ZXMiIHRhZywgSmVyb21lIGhhZCBwcm9wb3NlZCBzb21lIG1vZGlmaWNhdGlvbnMu
Cj4KPiBbUEFUQ0ggdjIgMC8zXSBjbGs6IEZpeCBpc3N1ZXMgcmVsYXRlZCB0byBDTEtfSUdOT1JF
X1VOVVNFRCBmYWlsdXJlcyBhbmQKPiBhbWxvZ2ljIGdsaXRjaCBmcmVlIG11eCAtIENodWFuIExp
dSB2aWEgQjQgUmVsYXkKPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMTExLWZp
eF9nbGl0Y2hfZnJlZS12Mi0wLTAwOTlmZDlhZDNlNUBhbWxvZ2ljLmNvbS8+Cj4KClRoZSBjb21t
ZW50cyBJJ3ZlIHByb3ZpZGVkIG9uIHRoaXMgc3RpbGwgc3RhbmRzLgoKPgo+IEFkZGluZyBDTEtf
T1BTX1BBUkVOVF9FTkFCTEUgY2F1c2VzIHRoZSBDTEtfSUdOT1JFX1VOVVNFRCBjb25maWd1cmF0
aW9uCj4gb2YgaXQncyBwYXJlbnQgY2xvY2tzIG9uIHRoZSBjaGFpbiB0byBiZWNvbWUgaW5lZmZl
Y3RpdmUsIHNvIHRoaXMgcGF0Y2gKPiBkZXBlbmRzIG9uIGZpeGluZyB0aGF0IGlzc3VlIGJlZm9y
ZSBpdCBjYW4gcHJvY2VlZC4KClVudXNlZCBjbG9ja3MgYXJlIE5PVCBhIGNvbmZpZ3VyYXRpb24u
CgpUaGV5IGFyZSBieS1wcm9kdWN0IG9mIHRoZSBib290bG9hZGVyLiBZb3UgY2Fubm90IHJlbHkg
b24gdGhlbS4gSWYKYW55dGhpbmcgZGVwZW5kcyBvbiB0aGVtLCB5b3UgaGF2ZSBhKG5vdGhlcikg
cHJvYmxlbSB0byBzb2x2ZS4gCgo+Cj4KPiBKZXJvbWUgYW5kIEkgaGF2ZSBzdWJtaXR0ZWQgcGF0
Y2hlcyB0byBhZGRyZXNzIHRoZSBpc3N1ZSBvZgo+IENMS19JR05PUkVfVU5VU0VEIGJlY29taW5n
IGluZWZmZWN0aXZlLiBJIG9yaWdpbmFsbHkgcGxhbm5lZCB0byB3YWl0Cj4gZm9yIHByb2dyZXNz
IG9uIHRoaXMgcGF0Y2ggYW5kIHRoZW4gaW5jb3Jwb3JhdGUgSmVyb21lJ3MgZmVlZGJhY2sgYmVm
b3JlCj4gc2VuZGluZyB0aGUgVjMgdmVyc2lvbi4KCkkndmUgcHJvdmlkZWQgYSBzdWdnZXN0aW9u
IGJ1dCB0aGlzIHNvbWV0aGluZyBoYXBwZW5pbmcgaW4gY2xvY2sgY29yZS4KSSBzdWdnZXN0IHRo
YXQgeW91IHNwbGl0IHRoaXMgb3V0IG9mIHlvdXIgc2VyaWVzIHNvIHRoaW5ncyB0aGF0IG5lZWQg
dG8KZ28gdGhyb3VnaCBTdGVwaGVuIGFyZSBub3QgbWl4ZWQgd2l0aCBBbWxvZ2ljIHN0dWZmLgoK
QnV0IGFnYWluLCB5b3UgY2Fubm90IHJlbHkgb24gdGhlIHN0YXRlIG9mIGNsb2NrIGp1c3QgYmVj
YXVzZSBpdCBoYXMKQ0xLX0lHTk9SRV9VTlVTRUQ6CgoqIE5vdGhpbmcgc2F5cyBpdCBpcyBlbmFi
bGVkIHRvIGJlZ2luIHdpdGgKKiBOb3RoaW5nIHNheXMgaXQgd2lsbCBzdGF5IG9uIGlmIGEgY29u
c3VtZXIgY29tZXMgYW5kIGdvZXMKKiAuLi4gYW5kIHllcywgaXQgZG9lcyBub3Qgc3Vydml2ZSBD
Q0YgdXNhZ2UgY2hlY2tpbmcgZG93biB0aGUgcm9hZC4KCkl0IGlzIHVucmVsaWFibGUgYW5kIGl0
IGlzIG5vdCBtZWFudCB0byBiZSBtb3JlIHRoYW4gdGhhdCwgQUZBSUsKCj4KPiBIaSBKZXJvbWUs
IHNvcnJ5IGlmIHRoaXMgY2F1c2VkIGFueSBtaXN1bmRlcnN0YW5kaW5nIG9uIHlvdXIgcGFydDsg
SQo+IHdpbGwgcHJvdmlkZSB0aW1lbHkgZmVlZGJhY2sgbW92aW5nIGZvcndhcmQuCj4KPgo+Pgo+
Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IE1hcnRpbgoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
