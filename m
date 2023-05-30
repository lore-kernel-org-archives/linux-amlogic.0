Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3677C77B73
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltI50VzBtpMwayGVOP0foQhUPl+dEZnXaTKmW0NNJks=; b=TL/M8Nt27fvH7/
	8M812sO11xwRY8FugEl7wSqQb4QJvSze2QMX8VQAkdfP/GPOz1cHoa6ExqvnUtL5yID2j9GBD8hrW
	b57VJuPwn2WDU8CQSwS42OoDQajNPUTr8aOOqZt7S1mZyZMrSVgfDr9C7WHAMWsRrfTQ1JA+FiTJY
	R99EZ7fBk/934Kc5f9FLrAyIUX284nSFDTr5bTrQ+ZErJ3BWjTmzDLLvA/O54/lrANRzqO7kvtPh8
	4J02TADa9MhM7+xcoIrDq7ex0MlUpbZkq42Uf3Tw3eG3XIWJcV0kOeP4h1KdGDr97opjFj8/dv71G
	+GpJLKIb9mct3JDl888w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3v7V-00D2S7-36;
	Tue, 30 May 2023 08:54:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3v7S-00D2PM-2T
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 08:54:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30aa76048fbso2633480f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 01:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685436855; x=1688028855;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7lmsQK6BFMTI9A/AzX7inZ2KLuLrjwLxSMKshDdVAw=;
        b=d5VHr4Q3mnwFyczW2+cOhPVcS8zLr+Uy1M3lKD7AV1NGmclkBewr7gwqfynffNAqXI
         RgpcGJCv84vbz0vqmd9ynf+2Z+gIs8SerbZROVyjUyMYcPToroo+l6eJAYsWd05tuY+1
         aD3XHXjg6Vdg6XvlmVVhB7ZtjQGxbThcA1Wftmc18S4vA2zKgx/hqO47iZtczU7o3QnN
         3xLu31JHtiL0m+UoR4veG50gvlrZFjPsGjc0gfPZ+Ur+tW55NqBF1B3tWeGpZaG6C0Ck
         Um4Otp0dfkZNuLiGvG2kqwxlSHtKrRHyTGNFjI5ZdVwdv0ngeT1ciN0Ww/mCJ4QM4X91
         lZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685436855; x=1688028855;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7lmsQK6BFMTI9A/AzX7inZ2KLuLrjwLxSMKshDdVAw=;
        b=YkovqsgDjjhjyPzyqWdfZmkqcS86e5+ur0+zV3bxEcRu9fsLUI+l1O+6Rug231K4AK
         +mhrVU1koCwk45aOmabJKuNvRMyq76gziyIkLfgYd+KDdpYqQnnitQvDMW9G5CHp+A71
         99umC+imrJU+IisW4i/4S5L5FGit05404k3ygTVlWISF/eGD0Hn538ZQfOHgE23vD1Dq
         IgwzsWAL1wUt5ZiTzD9C+ac5Kiz8osBtJgQdNBSUjSAxMiRQ97qt2hDZYXO+RWfZUs6h
         oGdrhUBi5pZ7mHsUzSXaAOVTmq9YG0jR4gqLy9QPOH8uwHmRJCL0XG0JqY8V2UvH/mUQ
         c6/Q==
X-Gm-Message-State: AC+VfDwsDJF9//S+FwR6iigAeZsF2XMKQ2XEaJmibED49gwKf2uezh9h
	YGk4Kpy89sTIPkUbTBE2FWM4+A==
X-Google-Smtp-Source: ACHHUZ5mdSXtRsWTAxAyhV2X4/AylNnjsOFA9svEkXVzAwvQUy/dmnSGfVdc7r4UWCqxmxDp8+4lKg==
X-Received: by 2002:a5d:534f:0:b0:30a:e5da:272d with SMTP id t15-20020a5d534f000000b0030ae5da272dmr1094379wrv.0.1685436854955;
        Tue, 30 May 2023 01:54:14 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4f10000000b002fda1b12a0bsm2573457wru.2.2023.05.30.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:54:14 -0700 (PDT)
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-7-ddrokosov@sberdevices.ru>
 <CAFBinCBs7-9CvfQLxLoG5=FjmSK+S5eGsLXOAyQN9kNOg2q-2g@mail.gmail.com>
 <20230522133212.fcxgsml4hmvj65bb@CAB-WSD-L081021>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 6/6] clk: meson: a1: add Amlogic A1 Peripherals
 clock controller driver
Date: Tue, 30 May 2023 10:32:57 +0200
In-reply-to: <20230522133212.fcxgsml4hmvj65bb@CAB-WSD-L081021>
Message-ID: <1jr0qy42tn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_015418_801416_94CFD3FF 
X-CRM114-Status: GOOD (  37.87  )
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

Ck9uIE1vbiAyMiBNYXkgMjAyMyBhdCAxNjozMiwgRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBz
YmVyZGV2aWNlcy5ydT4gd3JvdGU6Cgo+IEhlbGxvIE1hcnRpbiwKPgo+IFRoYW5rIHlvdSBzbyBt
dWNoIGZvciB0aGUgcmV2aWV3LCBJIHJlYWxseSBhcHByZWNpYXRlIGl0IQo+IFBsZWFzZSBmaW5k
IG15IGNvbW1lbnRzIGJlbG93Lgo+Cj4gT24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMTE6MDM6NTRQ
TSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPj4gSGkgRG1pdHJ5LAo+PiAKPj4g
T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzozM+KAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+PiBbLi4uXQo+PiA+ICtzdGF0aWMgc3RydWN0IGNs
a19yZWdtYXAgc3lzX2Jfc2VsID0gewo+PiA+ICsgICAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtf
cmVnbWFwX211eF9kYXRhKXsKPj4gPiArICAgICAgICAgICAgICAgLm9mZnNldCA9IFNZU19DTEtf
Q1RSTDAsCj4+ID4gKyAgICAgICAgICAgICAgIC5tYXNrID0gMHg3LAo+PiA+ICsgICAgICAgICAg
ICAgICAuc2hpZnQgPSAyNiwKPj4gPiArICAgICAgICAgICAgICAgLnRhYmxlID0gbXV4X3RhYmxl
X3N5cywKPj4gPiArICAgICAgIH0sCj4+ID4gKyAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNs
a19pbml0X2RhdGEpewo+PiA+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJzeXNfYl9zZWwiLAo+
PiA+ICsgICAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfbXV4X3JvX29wcywKPj4gdGhl
IHN5c18qX3NlbCBtdXhlcyBhbmQgc3lzXypfZ2F0ZSBhcmUgX3JvLi4uCj4+IAo+PiA+ICsgICAg
ICAgICAgICAgICAucGFyZW50X2RhdGEgPSBzeXNfcGFyZW50cywKPj4gPiArICAgICAgICAgICAg
ICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShzeXNfcGFyZW50cyksCj4+ID4gKyAgICAgICB9
LAo+PiA+ICt9Owo+PiA+ICsKPj4gPiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHN5c19iX2Rp
diA9IHsKPj4gPiArICAgICAgIC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9kaXZfZGF0YSl7
Cj4+ID4gKyAgICAgICAgICAgICAgIC5vZmZzZXQgPSBTWVNfQ0xLX0NUUkwwLAo+PiA+ICsgICAg
ICAgICAgICAgICAuc2hpZnQgPSAxNiwKPj4gPiArICAgICAgICAgICAgICAgLndpZHRoID0gMTAs
Cj4+ID4gKyAgICAgICB9LAo+PiA+ICsgICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5p
dF9kYXRhKXsKPj4gPiArICAgICAgICAgICAgICAgLm5hbWUgPSAic3lzX2JfZGl2IiwKPj4gPiAr
ICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX2RpdmlkZXJfb3BzLAo+PiAuLi5idXQg
dGhlIHN5c18qX2RpdiBhcmVuJ3QKPj4gSXMgdGhpcyBvbiBwdXJwb3NlPyBJZiBpdCBpczogd2h5
IGNhbiB0aGUgZGl2aWRlciBiZSBjaGFuZ2VkIGF0Cj4+IHJ1bnRpbWUgYnV0IHRoZSBtdXggY2Fu
J3Q/Cj4+IAo+Cj4gQWgsIHRoYXQncyBhIGdvb2QgY2F0Y2guIFNpbmNlIHRoZSBzeXN0ZW0gY2xv
Y2sgaXMgc2V0IHVwIGJ5IHRoZSBCb290Uk9NCj4gY29kZSwgYWxsIHN5c18qIGRpdmlkZXJzIGFu
ZCBnYXRlcyBzaG91bGQgYmUgcmVhZC1vbmx5LiBJJ2xsIG1ha2Ugc3VyZQo+IHRvIGNoYW5nZSB0
aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4KPj4gWy4uLl0KPj4gPiArLyoKPj4gPiArICogdGhl
IGluZGV4IDIgaXMgc3lzX3BsbF9kaXYxNiwgaXQgd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUg
Q1BVIGNsb2NrIGRyaXZlciwKPj4gV2UgbmVlZCB0byBhZGQgdGhlICJzeXNfcGxsX2RpdjE2IiBp
bnB1dCB0byB0aGUgZHQtYmluZGluZ3Mgc2luY2UgdGhleQo+PiBzaG91bGQgYWx3YXlzIGRlc2Ny
aWJlIHRoZSBoYXJkd2FyZSAocmVnYXJkbGVzcyBvZiB3aGF0IHRoZSBkcml2ZXIKPj4gaW1wbGVt
ZW50cyBjdXJyZW50bHkpLgo+PiBJJ20gbm90IHN1cmUgaG93IHRvIG1hbmFnZSB0aGlzIHdoaWxl
IHdlIGRvbid0IGhhdmUgdGhlIENQVSBjbG9jawo+PiBkcml2ZXIgcmVhZHkgeWV0IGJ1dCBJJ20g
c3VyZSBSb2Igb3IgS3J6eXN6dG9mIHdpbGwgYmUgYWJsZSB0byBoZWxwIHVzCj4+IGhlcmUuCj4+
IAo+Cj4gSSd2ZSBzaGFyZWQgbXkgdGhvdWdodHMgYWJvdXQgaXQgaW4gdGhlIGJpbmRpbmdzIHRo
cmVhZC4gUGxlYXNlIHRha2UgYQo+IGxvb2suCj4KPj4gPiArICogdGhlIGluZGV4IDQgaXMgdGhl
IGNsb2NrIG1lYXN1cmVtZW50IHNvdXJjZSwgaXQncyBub3Qgc3VwcG9ydGVkIHlldAo+PiBJIHN1
c3BlY3QgdGhhdCB0aGlzIGNvbWVzIGZyb20gdGhlIGNsb2NrIG1lYXN1cmVyIElQIGJsb2NrIGFu
ZCBpZiBzbwo+PiB0aGUgZHQtYmluZGluZ3Mgc2hvdWxkIHByb2JhYmx5IGRlc2NyaWJlIHRoaXMg
aW5wdXQuIEJ1dCBhZ2Fpbiwgd2UnZAo+PiBuZWVkIHRvIGtlZXAgaXQgb3B0aW9uYWwgZm9yIG5v
dyBzaW5jZSBvdXIgY2xvY2sgbWVhc3VyZXIgZHJpdmVyCj4+IGRvZXNuJ3QgZXZlbiBpbXBsZW1l
bnQgYSBjbG9jayBjb250cm9sbGVyLgo+PiAKPgo+IEluZGVlZCwgdGhpcyBpcyBhIHNpbWlsYXIg
c2l0dWF0aW9uIHRvIHdoYXQgd2UgaGF2ZSB3aXRoIHRoZSBpbnB1dHMgYW5kCj4gY2xvY2tzIG9m
IHRoZSBDUFUgYW5kIEF1ZGlvIGNsb2NrIGNvbnRyb2xsZXJzLiBJdCBzZWVtcyBsaWtlIHRoZXJl
IGlzCj4gb25seSBvbmUgb3B0aW9uIGhlcmU6IHdlIHNob3VsZCBtYXJrIGl0IHdpdGggYSBUT0RP
IHRhZy4uLgo+Cj4+IFsuLi5dCj4+ID4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBwd21fYV9z
ZWwgPSB7Cj4+ID4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2RhdGEp
ewo+PiA+ICsgICAgICAgICAgICAgICAub2Zmc2V0ID0gUFdNX0NMS19BQl9DVFJMLAo+PiA+ICsg
ICAgICAgICAgICAgICAubWFzayA9IDB4MSwKPj4gPiArICAgICAgICAgICAgICAgLnNoaWZ0ID0g
OSwKPj4gPiArICAgICAgIH0sCj4+ID4gKyAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19p
bml0X2RhdGEpewo+PiA+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJwd21fYV9zZWwiLAo+PiA+
ICsgICAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfbXV4X29wcywKPj4gPiArICAgICAg
ICAgICAgICAgLnBhcmVudF9kYXRhID0gcHdtX2FiY2RfcGFyZW50cywKPj4gPiArICAgICAgICAg
ICAgICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShwd21fYWJjZF9wYXJlbnRzKSwKPj4gPiAr
ICAgICAgICAgICAgICAgLyogRm9yIG1vcmUgaW5mb3JtYXRpb24sIHBsZWFzZSByZWZlciB0byBy
dGMgY2xvY2sgKi8KPj4gPiArICAgICAgICAgICAgICAgLmZsYWdzID0gQ0xLX1NFVF9SQVRFX05P
X1JFUEFSRU5ULAo+PiBBcyBtZW50aW9uZWQgaW4gWzBdIHdlJ2xsIHdvcmsgd2l0aCBIZWluZXIg
dG8gc2VlIGlmIHdlIGNhbiBpbXByb3ZlCj4+IHRoZSBkZWNpc2lvbiBtYWtpbmcgcHJvY2VzcyBv
ZiB0aGUgUFdNIGNvbnRyb2xsZXIgZHJpdmVyIHNvIHRoYXQgd2UKPj4gY2FuIGp1c3QgaGF2ZSAu
ZmxhZ3MgPSAwIGhlcmUuCj4+IFRoaXMgYXBwbGllcyB0byBhbGwgb3RoZXIgb2NjdXJyZW5jZXMg
b2YgdGhlIHNhbWUgY29tbWVudCBhYm91dCB0aGUgcnRjIGNsb2NrLgo+Cj4gU3VyZSwgSSdsbCBt
YWtlIHRoZSBjaGFuZ2UgaW4gdjE2LiBJbiBteSBvcGluaW9uLCB3ZSBzaG91bGQgcmVtb3ZlIHRo
ZQo+IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCBmbGFnIGZyb20gYWxsIFJUQyByZWxhdGVkIGNs
b2NrIG9iamVjdHMsCj4gaW5jbHVkaW5nIFBXTSwgcmVnYXJkbGVzcyBvZiB0aGUgb3V0Y29tZSBv
ZiB0aGUgSGVpbmVyIGRpc2N1c3Npb24uIEJhc2VkCj4gb24gb3VyIElSQyB0YWxrLCB0aGUgZGVj
aXNpb24gaGFzIG1vcmUgcHJvcyB0aGFuIGNvbnMgLQo+IGh0dHBzOi8vbGliZXJhLmlyY2xvZy53
aGl0ZXF1YXJrLm9yZy9saW51eC1hbWxvZ2ljLzIwMjMtMDUtMTgKClRoZSBjbG9jayBzY2hlbWUg
b2YgUFdNIGNvdWxkIGluZGVlZCBiZSBoYW5kbGVkIGxpa2UgYXVkaW8gaXMgYnV0IGl0Cm5vdCBz
dHJpY3RseSByZXF1aXJlZC4KCkluIGF1ZGlvIHdlIGhhdmUgYSBsaW1pdGVkIG51bWJlciBvZiBQ
TExzIChyb290IHNvdXJjZXMpLiBUaGVyZSBpcyBhIGxvdAptb3JlIGNvbnN1bW1lcnMgdGhhbiB0
aGVyZSBpcyByb290IHNvdXJjZXMuIElmIHRoZSByb290IHNvdXJjZXMgcmF0ZSBpcwpub3QgY2Fy
ZWZ1bGx5IGNob3NlbiB0byBzdGF0aXNmeSBhbGwgbmVlZHMsIHdlIGNvdWxkIGVuZCBpbiBhIHNp
dHVhdGlvbgp3aGVyZSB3ZSBjYW4ndCBzYXRpc2Z5IGFsbCBjb25zdW1tZXJzIG9yIHdlIG11c3Qg
Z2xpdGNoIHRoZSBzb3VyY2UgdG8gZG8Kc28uCgpGb3IgdGhlIFBXTSwgSSB0aGluayAoYnV0IEkn
bSBub3QgMTAwJSBzdXJlKSB0aGF0IHRoZSBtYWluIGNsb2NrIGNvbnRyb2xsZXIKcHJvdmlkZXMg
YSBzb3VyY2UgZm9yIGVhY2ggUFdNLiBObyByaXNrIG9mIHJhY2UgdGhlcmUuIFRoYXQgaXMgd2h5
IEFNTApkZWNpZGVkIHRvIGNvbXBsZXRseSBpZ25vcmUgdGhlIGNsb2NrIGVsZW1lbnQgaW4gdGhl
IFBXTSBJUCwgYmVjYXVzZQp0aGV5IGNhbiBkbyBhbG1vc3QgZXZlcnl0aGluZyB3aXRoIHdoYXQg
aXMgaW4gdGhlIG1haW4gY29udHJvbGxlciAuLi4gU3RpbGwKaWdub3JpbmcgdGhvc2UgcGFydCBp
cyB3cm9uZwoKRm9yIHRoZSBSVEMsIElmIHlvdSB3YW50L25lZWQgdG8gaGFuZGxlIGV4dGVybmFs
IFJUQ3MsIEkgZG9uJ3QgdGhpbmsgeW91CmhhdmUgbXVjaCBvZiBhIGNob2ljZS4gSWYgYm90aCB0
aGUgaW50ZXJuYWwgYW5kIGV4dGVybmFsICpyZXBvcnQqIHRoZQpzYW1lIHJhdGUsIENDRiBjYW4n
dCByZWFsbHkga25vdyBpZiBvbmUgaXMgYmVzdC4gSXQgd2lsbCBqdXN0IHBpY2sgb25lLApubyBu
ZWNlc3NhcmlseSB0aGUgb25lIHlvdSB3YW50LiBJIGRvbid0IHJlYWxseSBzZWUgYSB3YXkgYXJv
dW5kIG1hbnVhbApzZWxlY3Rpb24gZm9yIHRoaXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
