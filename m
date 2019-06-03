Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0A5C46460
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 21:58:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B576C26D15
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 21:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gpcvo3Mz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="cx2XGIJ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B576C26D15
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZJgioDTZIOXC9CTndeoeEfn1LSNu7HNE07VDNyUnnq4=; b=Gpcvo3MzBVQ5rFOTZ7FxTQB9Z
	QMXJYst+WOudVErEs6zbr9kQOUcTkxepo3tvt4u0k6MirIdsQo48X7WjtR6eckBVueiulssSAgYqq
	aGzi6msnbth/P5h/bvZyh5l+3z5XoZORZlzz4WAP+WfrfPenLoFzQ4oQoSJIwfaWyNjhyZ+5m3vsx
	L4OemEjEtcMm+1+BHHVxjthiEKleANsquPl1oLntV+F5+/5dhu/q4S6sSr5f+4pNTxV6KUjy46C7a
	bNdsKlZZDKgJF5AqpvXBL7X0Ix6AHRetW3hB/wO+UJwlkwn3ONAXFn96Ymb+Aphbpxd0OB5HRSnB8
	f+czAEI7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXuxw-0000Yz-20; Mon, 03 Jun 2019 21:58:04 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhUC-0004Fd-GQ; Mon, 03 Jun 2019 07:34:30 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HRdH0k2Kz9tyqt;
 Mon,  3 Jun 2019 09:34:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cx2XGIJ1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id t587eiMd2m8w; Mon,  3 Jun 2019 09:34:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HRdG6QQQz9v001;
 Mon,  3 Jun 2019 09:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559547250; bh=mANBXU7+AMcAciQx8IxmQjyNmlJQNbr71aM/BN8dzbo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cx2XGIJ1PTDY17Gl83f5iPGMktLRCTJLM9J6heu4l6yekYPXaaSe8NQ7w8javvDlm
 +Rtvv1EyMvZCS2u4NdeozM2Vz2dIhEX8vNm/TD2Mo+Ag96FfX5XRseZyRmVqril8w0
 6iQcfcnIjOsHS6DrJCAsxiHPl1B4h6/8idxnkiqo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 634B98B7B3;
 Mon,  3 Jun 2019 09:34:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PKsDjkW8A7c6; Mon,  3 Jun 2019 09:34:15 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CA588B7A1;
 Mon,  3 Jun 2019 09:34:14 +0200 (CEST)
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <64e136de-1a7b-3436-9675-44ea9fa7b64a@c-s.fr>
Date: Mon, 3 Jun 2019 09:34:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_003428_935936_A23320E4 
X-CRM114-Status: GOOD (  16.64  )
X-Mailman-Approved-At: Mon, 03 Jun 2019 14:58:01 -0700
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 Wolfram Sang <wsa@the-dreams.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Russell King <linux@armlinux.org.uk>, Paul Mackerras <paulus@samba.org>,
 Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Andy Gross <agross@kernel.org>,
 xen-devel@lists.xenproject.org, Jason Wang <jasowang@redhat.com>,
 Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
 Quentin Perret <quentin.perret@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Jiri Kosina <jkosina@suse.cz>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Feng Tang <feng.tang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Yannik Sembritzki <yannik@sembritzki.me>, Harry Wei <harryxiyou@gmail.com>,
 linux-i2c@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 YueHaibing <yuehaibing@huawei.com>, Robert Moore <robert.moore@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 David Brown <david.brown@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, linux-pci@vger.kernel.org,
 Bhupesh Sharma <bhsharma@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 platform-driver-x86@vger.kernel.org,
 Ding Xiang <dingxiang@cmss.chinamobile.com>, linux-kselftest@vger.kernel.org,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Raphael Gault <raphael.gault@arm.com>,
 Joel Stanley <joel@jms.id.au>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Darren Hart <dvhart@infradead.org>, Erik Schmauss <erik.schmauss@intel.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Palmer Dabbelt <palmer@sifive.com>,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 SeongJae Park <sj38.park@gmail.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org, devel@acpica.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Olof Johansson <olof@lixom.net>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, Michal Hocko <mhocko@suse.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
 Manfred Spraul <manfred@colorfullife.com>,
 Luis Chamberlain <mcgrof@kernel.org>, x86@kernel.org,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
 devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-edac@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Denis Efremov <efremov@ispras.ru>,
 netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andy@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAzMC8wNS8yMDE5IMOgIDAxOjIzLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgYSDDqWNyaXTC
oDoKPiBNb3N0bHkgZHVlIHRvIHg4NiBhbmQgYWNwaSBjb252ZXJzaW9uLCBzZXZlcmFsIGRvY3Vt
ZW50YXRpb24KPiBsaW5rcyBhcmUgc3RpbGwgcG9pbnRpbmcgdG8gdGhlIG9sZCBmaWxlLiBGaXgg
dGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIr
c2Ftc3VuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hY3BpL2RzZC9sZWRz
LnR4dCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2VybmVsLXBhcmFtZXRlcnMucnN0ICB8ICA2ICsrKy0tLQo+ICAgRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgIHwgMTYgKysrKysrKystLS0tLS0tLQo+
ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9yYXMucnN0ICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mc2wtZW5ldGMudHh0ICAgICAgICB8
ICA3ICsrKy0tLS0KPiAgIC4uLi9iaW5kaW5ncy9wY2kvYW1sb2dpYyxtZXNvbi1wY2llLnR4dCAg
ICAgICAgICB8ICAyICstCj4gICAuLi4vYmluZGluZ3MvcmVndWxhdG9yL3Fjb20scnBtaC1yZWd1
bGF0b3IudHh0ICAgfCAgMiArLQo+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jvb3Rpbmct
d2l0aG91dC1vZi50eHQgIHwgIDIgKy0KPiAgIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9ncGlv
L2JvYXJkLnJzdCAgICAgICAgICB8ICAyICstCj4gICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
Z3Bpby9jb25zdW1lci5yc3QgICAgICAgfCAgMiArLQo+ICAgLi4uL2Zpcm13YXJlLWd1aWRlL2Fj
cGkvZW51bWVyYXRpb24ucnN0ICAgICAgICAgIHwgIDIgKy0KPiAgIC4uLi9maXJtd2FyZS1ndWlk
ZS9hY3BpL21ldGhvZC10cmFjaW5nLnJzdCAgICAgICB8ICAyICstCj4gICBEb2N1bWVudGF0aW9u
L2kyYy9pbnN0YW50aWF0aW5nLWRldmljZXMgICAgICAgICAgfCAgMiArLQo+ICAgRG9jdW1lbnRh
dGlvbi9zeXNjdGwva2VybmVsLnR4dCAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICAgLi4u
L3RyYW5zbGF0aW9ucy9pdF9JVC9wcm9jZXNzL2hvd3RvLnJzdCAgICAgICAgIHwgIDIgKy0KPiAg
IC4uLi9pdF9JVC9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMucnN0ICAgICAgICB8ICA0ICsr
LS0KPiAgIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy80LkNvZGluZy5yc3QgICAgICB8
ICAyICstCj4gICBEb2N1bWVudGF0aW9uL3g4Ni94ODZfNjQvNWxldmVsLXBhZ2luZy5yc3QgICAg
ICAgfCAgMiArLQo+ICAgRG9jdW1lbnRhdGlvbi94ODYveDg2XzY0L2Jvb3Qtb3B0aW9ucy5yc3Qg
ICAgICAgIHwgIDQgKystLQo+ICAgLi4uL3g4Ni94ODZfNjQvZmFrZS1udW1hLWZvci1jcHVzZXRz
LnJzdCAgICAgICAgIHwgIDIgKy0KPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICAgYXJjaC9hcm0vS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvYXJtNjQva2VybmVsL2tl
eGVjX2ltYWdlLmMgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBhcmNoL3Bvd2VycGMvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgYXJjaC94ODYvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKystLS0tLS0t
LQo+ICAgYXJjaC94ODYvS2NvbmZpZy5kZWJ1ZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gICBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vYm9vdHBhcmFtX3V0aWxzLmgg
ICAgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2VfNjRfdHlwZXMu
aCAgICAgICAgICAgICB8ICAyICstCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlXzY0
X3R5cGVzLmggICAgICAgICAgfCAgMiArLQo+ICAgYXJjaC94ODYva2VybmVsL2NwdS9taWNyb2Nv
ZGUvYW1kLmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gveDg2L2tlcm5lbC9rZXhlYy1i
emltYWdlNjQuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBhcmNoL3g4Ni9rZXJuZWwvcGNp
LWRtYS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgYXJjaC94ODYvbW0vdGxi
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gveDg2L3Bs
YXRmb3JtL3B2aC9lbmxpZ2h0ZW4uYyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJz
L2FjcGkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0t
Cj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0Z21hYzEwMC5jICAgICAgICAgfCAg
MiArLQo+ICAgLi4uL2ZpZWxkYnVzL0RvY3VtZW50YXRpb24vZmllbGRidXNfZGV2LnR4dCAgICAg
IHwgIDQgKystLQo+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgIGluY2x1ZGUvYWNwaS9hY3BpX2RyaXZlcnMuaCAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gICBpbmNsdWRlL2xpbnV4L2ZzX2NvbnRleHQuaCAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgaW5jbHVkZS9saW51eC9sc21faG9va3MuaCAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIG1tL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBzZWN1cml0eS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgdG9vbHMvaW5jbHVkZS9saW51
eC9lcnIuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIHRvb2xzL29ianRvb2wv
RG9jdW1lbnRhdGlvbi9zdGFjay12YWxpZGF0aW9uLnR4dCB8ICA0ICsrLS0KPiAgIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3g4Ni9wcm90ZWN0aW9uX2tleXMuYyAgICB8ICAyICstCj4gICA0OCBm
aWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA3OCBkZWxldGlvbnMoLSkKClsuLi5dCgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmln
Cj4gaW5kZXggOGMxYzYzNjMwOGM4Li5lODY4ZDJiZDQ4YjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9w
b3dlcnBjL0tjb25maWcKPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+IEBAIC04OTgsNyAr
ODk4LDcgQEAgY29uZmlnIFBQQ19NRU1fS0VZUwo+ICAgCSAgcGFnZS1iYXNlZCBwcm90ZWN0aW9u
cywgYnV0IHdpdGhvdXQgcmVxdWlyaW5nIG1vZGlmaWNhdGlvbiBvZiB0aGUKPiAgIAkgIHBhZ2Ug
dGFibGVzIHdoZW4gYW4gYXBwbGljYXRpb24gY2hhbmdlcyBwcm90ZWN0aW9uIGRvbWFpbnMuCj4g
ICAKPiAtCSAgRm9yIGRldGFpbHMsIHNlZSBEb2N1bWVudGF0aW9uL3ZtL3Byb3RlY3Rpb24ta2V5
cy5yc3QKPiArCSAgRm9yIGRldGFpbHMsIHNlZSBEb2N1bWVudGF0aW9uL3g4Ni9wcm90ZWN0aW9u
LWtleXMucnN0CgpJdCBsb29rcyBzdHJhbmdlIHRvIHJlZmVyZW5jZSBhbiB4ODYgZmlsZSwgZm9y
IHBvd2VycGMgYXJjaC4KCkNocmlzdG9waGUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
