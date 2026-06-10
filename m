Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B591CD8CB2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2PFIcQYs1hEvo+6M8+HPv62dDk/GP8a/gTka3CO+XM=; b=e7DhfBihgIpn77
	ycBrbGwHF/c6I5aEM3e/XKtujaF3fhRbe2aMCBhAYJNncRLtxtea/+QduhaJu9K0XyQ3rP/2oG2fU
	CtRiS7o4ITX9xXyU3KtAXW+1gK4nhI9sBYDbP73mUfeolrr66Xp/JhlR4MgkQ1s19SnUsxwhFQUvI
	6ggA5vQ+r0WS48lA0bq+71bFjJFZFsX85F15wCwVHMKdIzJ87/tbUTyrxVT/0PqTvh5XdU8+Fa1Cw
	6bTbUScwFF60V8/+CVp2dFjupp1othZyNXgRezPmpbJ13eqjATB1J2cLxTycXAOn0hmh7BiSYHkuS
	xXd1a1ZU3ivpId6LNkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI1F-00000007dXW-0wIb;
	Wed, 10 Jun 2026 12:26:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI1C-00000007dWp-22qx
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 12:26:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b3e03939so55601515e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781094408; x=1781699208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=;
        b=M7JJ2bpdWC4TtYoRVaDboMwPu0md9Nny3XwiYBDJo5lk+d2RIc3wONMbAW0uc7LeT1
         JkRP8Kvd2+kq+jmm+IpY+Pc2FFdLi1ajZhsr/LfEiKOJcC9H9PD1GMp1VVEp1v6/JV4P
         FV+3UfQ2FhCVAPKHgpx3EVirRmsIImy7M8f1raK3QyamS7vUC5cH0uVCwF48qHXf6eXo
         vjI3dKFeg9nHnzSarz8MVHZrAxl1g2444pwtfynHi5vOxkq7mh2x/hsz3jH3ofGYN8zB
         9jH80Qm25fl4Biw3Eayv6RSJwfck/T5nq2Oie2hQHeRbAlKrhDTctDMTX6QMUlXLMaxb
         EZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094408; x=1781699208;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=;
        b=XdxYBv6lISovU6CFUTz9mcu8brZciqv9zPjj5scdUfGG7lLXhwFUgrUQUWr6b+Tr3+
         CAH6cu/qcRrEXHY5BVDNKrGoaaaE/uQ/oDlEeCzY3hsWy72GQH7RdzWNriA8kybRXFD1
         5YOsor/twxmF2LszxtRpSbGuWBZPgbWjF2kfyCjBR4QBrVodvqyHwaxEcUgFOjhF6CqT
         1VFVj42m1Fqx92jFJK8Upt0auG40sfHWxVKyW2T6N9jvDNFQVWz87mRv+qgO0YhV9yLQ
         LAiYcfa05FU78+vsfZe3sGt/48MZxIHbBItK8eQ3feQev+vnX1n8LQr2G2h5rD5CiwfE
         NGUA==
X-Forwarded-Encrypted: i=1; AFNElJ9x0/laPpBqDZQyIQiElEQp0rzw61+yg7bkNi8tzzPViMO7IbpfWGBEaH4DWYDjlhXq732go2GxVwnWTfuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwTIKHpX1xUYR4QCuNWWgjEcT3fIEGw95L6z9tNzH7uEE4OLKYg
	BlDyD7XDeXzJqaq6GOeirSD05vNOTfbLrP09KJ7I01guH6coZ/XPFgnUAUBFwUEzs+g=
X-Gm-Gg: Acq92OE43nY1CoI6Y9/M9SjjxRGv+PPe8BV/CtT3rvKk9ZsKs71+kWZUqnD9n2mvw+s
	iZKhsJ88nAI7fhZ1s6USvqv41RxSx1ZES2a9KZSMGMeT8xRhymfbAv4YiGf1mdD9K1guEyr1sme
	ic5sASG9/YHzfD2smdaM4L77sDbZOdLeUS8LBl+euk4jXlm6QXfxH6gWtveZxPUTkp6g/2yyOmo
	EUMzPXP7sIgZahgCR4vxjqPRjc0+NMjo6i+CjATofurrO/DzSD8eHE8FlCx1JOXW9yRY3OUpaHW
	a/u750uAy3b1Iia6nmDM/rnBqQBtybzjx4B+ET0qAgqVedBH9JRE5DYDQvKJP7aqKhuZv9YBXmA
	MCXhiHpcl+QDhULQR36rgyJDDxZcdGW6rwMTvfyf5SkkTytbnMpqCf/NO/ZCYeKuiJC8u74K+qx
	55QrG117GlGkffSXpO9r7m1mSuS5LZ2BkY
X-Received: by 2002:a05:600c:4ed1:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-490c2cf67f7mr331756785e9.10.1781094408066;
        Wed, 10 Jun 2026 05:26:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc39def5sm547623695e9.5.2026.06.10.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:26:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com> (Jian Hu's
	message of "Wed, 10 Jun 2026 12:18:54 +0800")
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
	<20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
	<1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
	<67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:26:45 +0200
Message-ID: <1jpl1yfunu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_052650_860320_CCAACEC8 
X-CRM114-Status: GOOD (  27.99  )
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

T24gbWVyLiAxMCBqdWluIDIwMjYgYXQgMTI6MTgsIEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5j
b20+IHdyb3RlOgoKPiBIaSBKZXJvbWUsCj4KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Cj4KPiBP
biA2LzMvMjAyNiAxMDoyOSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4+Cj4+IE9uIFdlZCAwMyBKdW4gMjAyNiBhdCAyMDoxNywgSmlhbiBIdSB2aWEgQjQg
UmVsYXkgPGRldm51bGwramlhbi5odS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4+IEZyb206IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+Pgo+Pj4gQWRkIHRoZSBB
bHdheXMtb24gY2xvY2sgY29udHJvbGxlciBkcml2ZXIgZm9yIHRoZSBBbWxvZ2ljIEE5IFNvQyBm
YW1pbHkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNv
bT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgIHwgIDEzICsrCj4+
PiAgIGRyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlICAgfCAgIDEgKwo+Pj4gICBkcml2ZXJzL2Ns
ay9tZXNvbi9hOS1hb2Nsay5jIHwgNDE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MzMgaW5zZXJ0aW9ucygrKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnIGIvZHJpdmVycy9jbGsv
bWVzb24vS2NvbmZpZwo+Pj4gaW5kZXggY2Y4Y2YzZjllNGVlLi42MjVlNjc4OGI5NDAgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4+PiArKysgYi9kcml2ZXJzL2Ns
ay9tZXNvbi9LY29uZmlnCj4+PiBAQCAtMTMyLDYgKzEzMiwxOSBAQCBjb25maWcgQ09NTU9OX0NM
S19BMV9QRVJJUEhFUkFMUwo+Pj4gICAgICAgICAgZGV2aWNlLCBBMSBTb0MgRmFtaWx5LiBTYXkg
WSBpZiB5b3Ugd2FudCBBMSBQZXJpcGhlcmFscyBjbG9jawo+Pj4gICAgICAgICAgY29udHJvbGxl
ciB0byB3b3JrLgo+Pj4KPj4+ICtjb25maWcgQ09NTU9OX0NMS19BOV9BTwo+Pj4gKyAgICAgdHJp
c3RhdGUgIkFtbG9naWMgQTkgU29DIEFPIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydCIKPj4+ICsg
ICAgIGRlcGVuZHMgb24gQVJNNjQKPj4+ICsgICAgIGRlZmF1bHQgQVJDSF9NRVNPTiB8fCBDT01Q
SUxFX1RFU1QKPj4+ICsgICAgIHNlbGVjdCBDT01NT05fQ0xLX01FU09OX1JFR01BUAo+Pj4gKyAg
ICAgc2VsZWN0IENPTU1PTl9DTEtfTUVTT05fQ0xLQ19VVElMUwo+Pj4gKyAgICAgc2VsZWN0IENP
TU1PTl9DTEtfTUVTT05fRFVBTERJVgo+Pj4gKyAgICAgaW1wbHkgQ09NTU9OX0NMS19TQ01JCj4+
PiArICAgICBoZWxwCj4+PiArICAgICAgIFN1cHBvcnQgZm9yIHRoZSBBTyBjbG9jayBjb250cm9s
bGVyIG9uIEFtbG9naWMgQTMxMVkzIGJhc2VkCj4+PiArICAgICAgIGRldmljZSwgQUtBIEE5Lgo+
Pj4gKyAgICAgICBTYXkgWSBpZiB5b3Ugd2FudCBBOSBBTyBjbG9jayBjb250cm9sbGVyIHRvIHdv
cmsuCj4+PiArCj4+PiAgIGNvbmZpZyBDT01NT05fQ0xLX0MzX1BMTAo+Pj4gICAgICAgIHRyaXN0
YXRlICJBbWxvZ2ljIEMzIFBMTCBjbG9jayBjb250cm9sbGVyIgo+Pj4gICAgICAgIGRlcGVuZHMg
b24gQVJNNjQKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSBiL2Ry
aXZlcnMvY2xrL21lc29uL01ha2VmaWxlCj4+PiBpbmRleCBjNjcxOTY5NGEyNDIuLmY4OWQwMjdj
MjgyYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlCj4+PiArKysg
Yi9kcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZQo+Pj4gQEAgLTE5LDYgKzE5LDcgQEAgb2JqLSQo
Q09ORklHX0NPTU1PTl9DTEtfQVhHKSArPSBheGcubyBheGctYW9jbGsubwo+Pj4gICBvYmotJChD
T05GSUdfQ09NTU9OX0NMS19BWEdfQVVESU8pICs9IGF4Zy1hdWRpby5vCj4+PiAgIG9iai0kKENP
TkZJR19DT01NT05fQ0xLX0ExX1BMTCkgKz0gYTEtcGxsLm8KPj4+ICAgb2JqLSQoQ09ORklHX0NP
TU1PTl9DTEtfQTFfUEVSSVBIRVJBTFMpICs9IGExLXBlcmlwaGVyYWxzLm8KPj4+ICtvYmotJChD
T05GSUdfQ09NTU9OX0NMS19BOV9BTykgKz0gYTktYW9jbGsubwo+Pj4gICBvYmotJChDT05GSUdf
Q09NTU9OX0NMS19DM19QTEwpICs9IGMzLXBsbC5vCj4+PiAgIG9iai0kKENPTkZJR19DT01NT05f
Q0xLX0MzX1BFUklQSEVSQUxTKSArPSBjMy1wZXJpcGhlcmFscy5vCj4+PiAgIG9iai0kKENPTkZJ
R19DT01NT05fQ0xLX0dYQkIpICs9IGd4YmIubyBneGJiLWFvY2xrLm8KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9tZXNvbi9hOS1hb2Nsay5jIGIvZHJpdmVycy9jbGsvbWVzb24vYTktYW9j
bGsuYwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjdi
M2NhMjMxYTQyCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9h
OS1hb2Nsay5jCj4+PiBAQCAtMCwwICsxLDQxOSBAQAo+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIE1JVCkKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAo
QykgMjAyNiBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPj4+ICsgKi8KPj4+ICsK
Pj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhOS1hb2Nsa2MuaD4KPj4+
ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgo+Pj4gKyNpbmNsdWRlICJjbGstcmVnbWFwLmgiCj4+PiArI2luY2x1
ZGUgImNsay1kdWFsZGl2LmgiCj4+PiArI2luY2x1ZGUgIm1lc29uLWNsa2MtdXRpbHMuaCIKPj4+
ICsKPj4+ICsjZGVmaW5lIEFPX09TQ0lOX0NUUkwgICAgICAgICAgICAgICAgICAgICAgICAweDAw
Cj4+PiArI2RlZmluZSBBT19TWVNfQ0xLMCAgICAgICAgICAgICAgICAgIDB4MDQKPj4+ICsjZGVm
aW5lIEFPX1BXTV9DTEtfQV9DVFJMICAgICAgICAgICAgMHgxYwo+Pj4gKyNkZWZpbmUgQU9fUFdN
X0NMS19CX0NUUkwgICAgICAgICAgICAweDIwCj4+PiArI2RlZmluZSBBT19QV01fQ0xLX0NfQ1RS
TCAgICAgICAgICAgIDB4MjQKPj4+ICsjZGVmaW5lIEFPX1BXTV9DTEtfRF9DVFJMICAgICAgICAg
ICAgMHgyOAo+Pj4gKyNkZWZpbmUgQU9fUFdNX0NMS19FX0NUUkwgICAgICAgICAgICAweDJjCj4+
PiArI2RlZmluZSBBT19QV01fQ0xLX0ZfQ1RSTCAgICAgICAgICAgIDB4MzAKPj4+ICsjZGVmaW5l
IEFPX1BXTV9DTEtfR19DVFJMICAgICAgICAgICAgMHgzNAo+Pj4gKyNkZWZpbmUgQU9fQ0VDX0NU
UkwwICAgICAgICAgICAgICAgICAweDM4Cj4+PiArI2RlZmluZSBBT19DRUNfQ1RSTDEgICAgICAg
ICAgICAgICAgIDB4M2MKPj4+ICsjZGVmaW5lIEFPX1JUQ19CWV9PU0NJTl9DVFJMMCAgICAgICAg
ICAgICAgICAweDUwCj4+PiArI2RlZmluZSBBT19SVENfQllfT1NDSU5fQ1RSTDEgICAgICAgICAg
ICAgICAgMHg1NAo+Pj4gKwo+Pj4gKyNkZWZpbmUgQTlfQ09NUF9TRUwoX25hbWUsIF9yZWcsIF9z
aGlmdCwgX21hc2ssIF9wZGF0YSkgXAo+Pj4gKyAgICAgTUVTT05fQ09NUF9TRUwoYTlfYW9fLCBf
bmFtZSwgX3JlZywgX3NoaWZ0LCBfbWFzaywgX3BkYXRhLCBOVUxMLCAwLCAwKQo+Pj4gKwo+Pj4g
KyNkZWZpbmUgQTlfQ09NUF9ESVYoX25hbWUsIF9yZWcsIF9zaGlmdCwgX3dpZHRoKSBcCj4+PiAr
ICAgICBNRVNPTl9DT01QX0RJVihhOV9hb18sIF9uYW1lLCBfcmVnLCBfc2hpZnQsIF93aWR0aCwg
MCwgQ0xLX1NFVF9SQVRFX1BBUkVOVCkKPj4+ICsKPj4+ICsjZGVmaW5lIEE5X0NPTVBfR0FURShf
bmFtZSwgX3JlZywgX2JpdCkgXAo+Pj4gKyAgICAgTUVTT05fQ09NUF9HQVRFKGE5X2FvXywgX25h
bWUsIF9yZWcsIF9iaXQsIENMS19TRVRfUkFURV9QQVJFTlQpCj4+PiArCj4+PiArc3RhdGljIHN0
cnVjdCBjbGtfcmVnbWFwIGE5X2FvX3h0YWxfaW4gPSB7Cj4+PiArICAgICAuZGF0YSA9ICYoc3Ry
dWN0IGNsa19yZWdtYXBfZ2F0ZV9kYXRhKXsKPj4+ICsgICAgICAgICAgICAgLm9mZnNldCA9IEFP
X09TQ0lOX0NUUkwsCj4+PiArICAgICAgICAgICAgIC5iaXRfaWR4ID0gMywKPj4+ICsgICAgIH0s
Cj4+PiArICAgICAvKgo+Pj4gKyAgICAgICogSXQgbWF5IGJlIGFvX3N5cydzIHBhcmVudCBjbG9j
aywgaXRzIGNoaWxkIGNsb2NrcyBtYXJrCj4+PiArICAgICAgKiBDTEtfSVNfQ1JJVElDQUwsIFNv
IG1hcmsgQ0xLX0lTX0NSSVRJQ0FMIGZvciBpdC4KPj4+ICsgICAgICAqLwo+PiBJIGRvbid0IHJl
YWxseSBnZXQgd2hhdCB5b3UgbWVhbiAuLi4gQ291bGQgeW91IHJlcGhyYXNlID8KPgo+Cj4gVGhl
IEFPIHN5cyBnYXRlIGNsb2NrIGNoYWluIG1heSBiZToKPgo+IGFvX3h0YWxfaW4tPmFvX3h0YWwt
PmFvX3N5cy0+IEFPIHN5cyBnYXRlIGNsb2Nrcwo+Cj4gImFvX3h0YWxfaW4iIGlzIHBhcnQgb2Yg
dGhlIHBhcmVudCBjaGFpbiBvZiB0aGUgQU8gc3lzIGdhdGUgY2xvY2tzLgo+Cj4gU29tZSBvZiBp
dHMgZG93bnN0cmVhbSBjbG9ja3MgYXJlIG1hcmtlZCB3aXRoIENMS19JU19DUklUSUNBTC4gVG8g
ZW5zdXJlCj4gdGhvc2UgY2xvY2tzIHJlbWFpbiBmdW5jdGlvbmFsLCBhb194dGFsX2luIG11c3Qg
bm90IGJlIGRpc2FibGVkIGFuZCBpcwo+IHRoZXJlZm9yZSBtYXJrZWQgYXMgQ0xLX0lTX0NSSVRJ
Q0FMIGFzIHdlbGwuCgpJZiBhbnkgb2YgdGhlIGRvd25zdHJlYW0gY2xvY2tzIGFyZSBjcml0aWNh
bCBhbmQgbWFya2VkIGFzIHN1Y2gsIHRoZXJlIGlzIG5vdApuZWVkIHRvIG1hcmsgdGhpcyBvbmUg
YXMgd2VsbC4KCllvdSBzaG91bGQgb25seSBtYXJrIHRoZSBjbG9ja3MgdGhhdCBhcmUgYWN0dWFs
bHkgY3JpdGljYWwgd2l0aCB0aGUgZmxhZwphbmQgbGV0IENDRiBmaWd1cmUgb3V0IHRoZSBkZXBl
bmRlbmNpZXMuCgo+Cj4KPiBJIHdpbGwgcmVwaHJhc2UgaXQgbGlrZSB0aGlzIGluIHRoZSBuZXh0
IHZlcnNpb246Cj4KPiDCoCDCoCDCoCDCoCAvKgo+IMKgIMKgIMKgIMKgIMKgKiBhb19zeXMgY2Fu
IHNlbGVjdCBkaWZmZXJlbnQgY2xvY2sgc291cmNlcy4gT25lIHBvc3NpYmxlIGNsb2NrCj4gcGF0
aCBpczoKPiDCoCDCoCDCoCDCoCDCoCrCoCDCoCDCoCBhb194dGFsX2luLT5hb194dGFsLT5hb19z
eXMtPiBhbyBzeXMgZ2F0ZSBjbG9ja3MKPiDCoCDCoCDCoCDCoCDCoCoKPiDCoCDCoCDCoCDCoCDC
oCogYW9feHRhbF9pbiBpcyBpbiB0aGUgcGFyZW50IGNoYWluIG9mIEFPIHN5cyBnYXRlIGNsb2Nr
cy4KPiDCoCDCoCDCoCDCoCDCoCogU2luY2Ugc29tZSBkb3duc3RyZWFtIGNsb2NrcyBhcmUgbWFy
a2VkIENMS19JU19DUklUSUNBTCwKPiDCoCDCoCDCoCDCoCDCoCogYW9feHRhbF9pbiBtdXN0IHJl
bWFpbiBlbmFibGVkIGFuZCBpcyB0aGVyZWZvcmUgbWFya2VkCj4gwqAgwqAgwqAgwqAgwqAqIENM
S19JU19DUklUSUNBTCBhcyB3ZWxsLgo+IMKgIMKgIMKgIMKgIMKgKi8KPgo+Pj4gKyAgICAgLmh3
LmluaXQgPSBDTEtfSFdfSU5JVF9GV19OQU1FKCJhb194dGFsX2luIiwgInh0YWwiLAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjbGtfcmVnbWFwX2dhdGVfb3BzLCBD
TEtfSVNfQ1JJVElDQUwpLAo+PiBJJ20gaG9uZXN0bHkgbm90IHN1cmUgYWJvdXQgdGhpcy4gSXQg
aXMgY29ycmVjdCwgc3VyZSBhbmQgdGhlIG1hY3JvIGV4aXN0IHRvIGJlCj4+IHVzZWQgYnV0IC4u
LiBJdCBkb2VzIG5vdCByZWFsbHkgaGVscCByZWFkYWJpbGl0eSBoZXJlLCBkb2VzIGl0ID8KPj4K
Pj4gKEkga25vdyB0aGF0IHdhcyBhIGZlZWRiYWNrIHlvdSd2ZSBnb3Qgb24gdjEpCj4+Cj4+IE90
aGVyIHRoYW4gdGhhdCwgdGhpcyBsb29rcyBnb29kIHRvIG1lLgo+Pgo+IE9rLCBJIHdpbGwgdXNl
IHRoZSBvcmlnaW5hbCBjbGtfaW5pdF9kYXRhIGZvciB0aGlzIG9uZS4KCldlbGwgbXkgY29tbWVu
dCBhcHBsaWVzIHRvIHdob2xlIHRoaW5nIHJlYWxseS4KClRoZXJlIGFyZSBzdXJlbHkgd2F5cyBp
biB3aGljaCB0aGUgbWFjcm8gYnV0IHRoZSB3YXkgd2Ugc3RhdGljYWxseQpkZWNsYXJlIHRoaW5n
cywgaXQgYWRkcyBhIGxldmVsIG9mIGluZGlyZWN0aW9uIHRoYXQgbWFrZXMgdGhpbmdzIGhhcmRl
cgp0byByZXZpZXcgSU1PLgoKPgo+Cj4gWyAuLi4gXQo+Cj4+IC0tCj4+IEplcm9tZQoKLS0gCkpl
cm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
